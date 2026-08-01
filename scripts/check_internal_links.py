#!/usr/bin/env python3
"""Check generated HTML for broken internal links, assets, and fragments."""

from __future__ import annotations

import argparse
import sys
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urljoin, urlsplit


URL_ATTRIBUTES = {
    "a": ("href",),
    "iframe": ("src",),
    "img": ("src", "srcset"),
    "link": ("href",),
    "script": ("src",),
    "source": ("src", "srcset"),
    "video": ("poster", "src"),
}
SKIPPED_SCHEMES = {"blob", "data", "javascript", "mailto", "tel"}


class DocumentParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.ids: set[str] = set()
        self.references: list[tuple[str, str, str]] = []
        self.canonical_hosts: set[str] = set()

    def handle_starttag(
        self, tag: str, attrs: list[tuple[str, str | None]]
    ) -> None:
        attributes = dict(attrs)
        element_id = attributes.get("id")
        if element_id:
            self.ids.add(element_id)
        if tag == "a" and attributes.get("name"):
            self.ids.add(attributes["name"])

        rel = (attributes.get("rel") or "").split()
        if tag == "link" and "canonical" in rel and attributes.get("href"):
            host = urlsplit(attributes["href"]).hostname
            if host:
                self.canonical_hosts.add(host)

        for attribute in URL_ATTRIBUTES.get(tag, ()):
            value = attributes.get(attribute)
            if not value:
                continue
            if attribute == "srcset":
                for candidate in value.split(","):
                    fields = candidate.strip().split()
                    if fields:
                        self.references.append((tag, attribute, fields[0]))
            else:
                self.references.append((tag, attribute, value))


def document_url(relative_path: Path) -> str:
    posix_path = relative_path.as_posix()
    if posix_path == "index.html":
        return "/"
    if posix_path.endswith("/index.html"):
        return f"/{posix_path[:-10]}"
    return f"/{posix_path}"


def target_path(output_dir: Path, url_path: str) -> Path | None:
    relative = unquote(url_path).lstrip("/")
    direct = output_dir / relative
    candidates = [direct]
    if not relative or url_path.endswith("/"):
        candidates.insert(0, direct / "index.html")
    elif not Path(relative).suffix:
        candidates.insert(0, direct / "index.html")

    for candidate in candidates:
        if candidate.is_file():
            return candidate
    return None


def parse_document(path: Path) -> DocumentParser:
    parser = DocumentParser()
    parser.feed(path.read_text(encoding="utf-8"))
    return parser


def check(output_dir: Path) -> list[str]:
    html_files = sorted(output_dir.rglob("*.html"))
    if not html_files:
        return [f"No HTML files found in {output_dir}"]

    documents = {path: parse_document(path) for path in html_files}
    internal_hosts = {
        host
        for document in documents.values()
        for host in document.canonical_hosts
    }
    issues: set[str] = set()

    for source_path, document in documents.items():
        relative_source = source_path.relative_to(output_dir)
        source_url = document_url(relative_source)
        base_url = f"https://internal.invalid{source_url}"

        for tag, attribute, reference in document.references:
            parsed_reference = urlsplit(reference)
            if parsed_reference.scheme in SKIPPED_SCHEMES:
                continue
            if parsed_reference.scheme and parsed_reference.scheme not in {"http", "https"}:
                continue
            if parsed_reference.hostname and parsed_reference.hostname not in internal_hosts:
                continue

            resolved = urlsplit(urljoin(base_url, reference))
            destination = target_path(output_dir, resolved.path)
            context = f"{relative_source}: <{tag} {attribute}={reference!r}>"
            if destination is None:
                issues.add(f"{context} targets missing {unquote(resolved.path)}")
                continue

            if resolved.fragment and destination.suffix == ".html":
                target_document = documents.get(destination)
                if target_document is None:
                    target_document = parse_document(destination)
                fragment = unquote(resolved.fragment)
                if fragment not in target_document.ids:
                    issues.add(
                        f"{context} targets missing fragment #{fragment} in "
                        f"{destination.relative_to(output_dir)}"
                    )

    return sorted(issues)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output_dir", type=Path, help="Hugo output directory")
    args = parser.parse_args()

    output_dir = args.output_dir.resolve()
    if not output_dir.is_dir():
        parser.error(f"not a directory: {output_dir}")

    issues = check(output_dir)
    if issues:
        print(f"Found {len(issues)} broken internal references:", file=sys.stderr)
        for issue in issues:
            print(f"- {issue}", file=sys.stderr)
        return 1

    html_count = sum(1 for _ in output_dir.rglob("*.html"))
    print(f"Checked {html_count} HTML files: all internal references resolve.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
