# Repository Guidelines

## Project Structure & Module Organization

This repository is a multilingual Hugo site. Page content lives in `content/`; Czech uses `index.md`, while translations use language suffixes such as `index.en.md` or `index.ru.md`. Keep page-specific images beside the page bundle. Shared images belong in `static/`, custom CSS in `assets/css/extended/`, and project-specific templates or shortcodes in `layouts/`. Site settings are split between `config/_default/`, `config/develop/`, and `config/production/`. `themes/POD/` is a Git submodule; prefer project-level overrides instead of editing the submodule. Deployment manifests are under `helm-chart/`.

## Build, Test, and Development Commands

See `README.md` for the complete local setup, prerequisites, troubleshooting, and content workflow.

- `git submodule update --init --recursive` initializes the pinned POD theme after cloning; do not add it as a new submodule.
- `docker compose up --build` starts Hugo at `http://localhost:1313` and imgproxy at `http://localhost:8080`; it also attempts to refresh contact data from Hydra. Images come from `registry01.in.podolee.cz`, which may require authentication.
- Native development uses standard Hugo 0.164.0 (matching the Dockerfiles). Run `bash scripts/fetch_contacts.sh` first; it requires Bash, wget, jq, and readlink with `-f` support and writes the ignored `data/contacts.json`. Existing valid data can be reused offline. Never run this script with the host's POSIX `sh`.
- `HUGO_PARAMS_IMGPROXYURL=https://img.podolee.cz hugo server --disableFastRender --navigateToChanged` runs natively using the public image proxy. Alternatively, start `docker compose up -d imgproxy` and omit the override. Add `--buildDrafts` to preview drafts.
- `hugo server` defaults to the `development` environment, not the staging environment named `develop`. Static builds default to `production`.
- `hugo new services/<slug>/index.md`, `hugo new --kind post_category posts/<category>/_index.md`, and `hugo new --kind post posts/<category>/<slug>/index.md` use the repository archetypes. For Docker-only workflows, replace `hugo` with `docker compose run --rm --no-deps web hugo`.

## Coding Style & Naming Conventions

Use two-space indentation in YAML and follow the surrounding style in HTML templates, CSS, and shell scripts. Use lowercase kebab-case for content directories and slugs. Translation bundles must share the same directory and slug across languages. Preserve archetype front matter and remove `draft: true` only when content is ready. Markdown lint configuration is in `.markdownlint.json`; long lines and inline HTML are intentionally allowed.

## Testing Guidelines

Run the automated build and internal-reference checks for both deployed environments after preparing contact data:

```sh
sh scripts/validate_site.sh
HUGO_ENV=develop sh scripts/validate_site.sh
```

These commands require Hugo and Python 3.10+ and do not fetch contacts. The Docker equivalents are `docker compose run --rm --no-deps web sh scripts/validate_site.sh` and `docker compose run --rm --no-deps -e HUGO_ENV=develop web sh scripts/validate_site.sh` after building the `web` image and preparing contacts. The validator fails on Hugo warnings and checks generated internal links, assets, and fragments; it does not check remote URL availability. Without an output argument it cleans up its temporary output; an explicit output directory is cleaned before building, so never point it at source files. Also inspect changed pages, navigation, images, and affected languages in the browser. Do not commit generated output.

## Commit & Pull Request Guidelines

Recent history uses short, imperative, sentence-case subjects such as `Add documents` and `Fix publish date`. Keep each commit focused. Pull requests should explain the user-visible change, list affected URLs and languages, and link the relevant issue. Include before/after screenshots for layout or styling changes and note the local build command used. Changes merged to `develop` deploy to staging; `main` deploys to production through GitLab CI.

## Configuration & Security

Do not commit credentials, tokens, or private contact exports. Keep environment-specific URLs and settings in the appropriate `config/` or Helm values file. Review changes to `scripts/fetch_contacts.sh` carefully because it consumes live Hydra data.
