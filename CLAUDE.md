# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About

Hugo static site for [awfulwoman.com](https://awfulwoman.com). Uses Hugo modules for icons (Bootstrap + MDI icon sets) and extended Hugo features (SCSS processing).

## Prerequisites

```sh
brew install pre-commit exiftool hugo
pre-commit install
```

## Commands

```sh
hugo server --disableFastRender -w   # dev server with live reload
hugo --destination ./_site           # production build
```

## Architecture

- `hugo.yaml` — site config: base URL, taxonomies (tags only), permalink patterns, imaging defaults, Hugo module imports
- `content/` — all content as Markdown; section names map to URL paths (`posts/`, `notes/`, `journal/`, `bookmarks/`, `photos/`, `guineapigs/`, `quotes/`, `likes/`, `reposts/`, `replies/`, `checkins/`, `bandnames/`)
- `layouts/` — all templates; `_default/` contains base templates (`baseof.html`, `single.html`, `section.html`, `home.html`, `taxonomy.html`, `term.html`); `partials/` contains reusable fragments
- `assets/scss/` — ITCSS-structured stylesheets with numbered layer directories (`10_settings` → `70_utilities`), compiled by Hugo Pipes
- `static/` — favicon set and web manifest; no JS bundling
- `archetypes/` — `default.md` creates drafts; `notes.md` creates non-draft notes

## Content & Pre-commit

Pre-commit hooks enforce trailing newlines and strip whitespace from `content/` Markdown files. A local hook (`exif.sh`) strips all EXIF metadata (including GPS location) from any images committed under `content/`.

## Deployment

Gitea Actions CI (`/.gitea/workflows/build.yaml`) builds with Hugo on every push to `main` and rsyncs `_site/` to the production server at `awfulwoman.com` via SSH.
