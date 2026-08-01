# Repository Guidelines

## Project Structure & Module Organization

This repository is a multilingual Hugo site. Page content lives in `content/`; Czech uses `index.md`, while translations use language suffixes such as `index.en.md` or `index.ru.md`. Keep page-specific images beside the page bundle. Shared images belong in `static/`, custom CSS in `assets/css/extended/`, and project-specific templates or shortcodes in `layouts/`. Site settings are split between `config/_default/`, `config/develop/`, and `config/production/`. `themes/POD/` is a Git submodule; prefer project-level overrides instead of editing the submodule. Deployment manifests are under `helm-chart/`.

## Build, Test, and Development Commands

- `git submodule update --init --recursive` initializes the POD theme after cloning.
- `docker compose up --build` starts Hugo at `http://localhost:1313` and imgproxy at port 8080; it also refreshes contact data from Hydra.
- `hugo server --disableFastRender --navigateToChanged` runs the site directly when Hugo is installed locally.
- `hugo --environment production` performs a production-style static build into `public/`.
- `hugo new --kind post posts/<category>/<slug>/index.md` creates a post from the repository archetype.

## Coding Style & Naming Conventions

Use two-space indentation in YAML and follow the surrounding style in HTML templates, CSS, and shell scripts. Use lowercase kebab-case for content directories and slugs. Translation bundles must share the same directory and slug across languages. Preserve archetype front matter and remove `draft: true` only when content is ready. Markdown lint configuration is in `.markdownlint.json`; long lines and inline HTML are intentionally allowed.

## Testing Guidelines

There is no automated test suite. Before submitting, run a clean Hugo production build and inspect changed pages, navigation, images, and all affected language variants in the local server. Treat Hugo warnings, broken internal links, missing resources, and malformed front matter as failures. Do not commit generated `public/` output unless the change explicitly requires it.

## Commit & Pull Request Guidelines

Recent history uses short, imperative, sentence-case subjects such as `Add documents` and `Fix publish date`. Keep each commit focused. Pull requests should explain the user-visible change, list affected URLs and languages, and link the relevant issue. Include before/after screenshots for layout or styling changes and note the local build command used. Changes merged to `develop` deploy to staging; `main` deploys to production through GitLab CI.

## Configuration & Security

Do not commit credentials, tokens, or private contact exports. Keep environment-specific URLs and settings in the appropriate `config/` or Helm values file. Review changes to `scripts/fetch_contacts.sh` carefully because it consumes live Hydra data.
