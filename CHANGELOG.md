# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).  
One repository hosts two packages, so releases are tagged per ecosystem (`ruby-vX.Y.Z` for the RubyGems gem, `python-vX.Y.Z` for the PyPI library).

## [0.1.1] - 2026-07-20

## [0.1.1] - 2026-07-20

### 1. Fixed

- `RubyGem - Release` workflow: `ruby/setup-ruby` now resolves the Ruby version from `RubyGem/.ruby-version` instead of erroring (`input ruby-version needs to be specified…`) when `.ruby-version` existed only at the repository root, so a `ruby-v*` tag push builds and publishes the gem to completion.

### 2. Changed

- Both packages now publish automatically via Trusted Publishing (OIDC) on their release tags (`ruby-vX.Y.Z` / `python-vX.Y.Z`); `PyPI/.python-version` mirrors the RubyGem toolchain scoping for symmetry across the ecosystem directories. The packaged `file-clean` CLI and library behaviour are unchanged from 0.1.0 — this is a release-automation maintenance release.

## [0.1.0] - 2026-07-20

### 1. Added

- `track-delimiter` CLI with `--extension` (default `.m4a`), `--delimiter` (default `_`) and `--mode d|e` (dry run by default; `e` executes the renames) flags, plus `--version` and `--help`, replacing the interactive `rake run_itunes_file_delimiter_replacer` / `invoke run_itunes_file_delimiter_replacer` prompts as the packaged entry point (Ruby and Python).
- Ruby gem packaging: `SpreenTracks` module under `RubyGem/lib/`, `require 'spreen-tracks'` shim, `spreen-tracks.gemspec`, `exe/track-delimiter`, and RBS signatures shipped in the gem.
- Python packaging: `spreen_tracks` package under `PyPI/src/`, full PyPI metadata in `pyproject.toml`, `track-delimiter` console script, and the `py.typed` marker.
- CLI test coverage for both implementations alongside the existing application tests.
- The package icon (`assets/spreen-tracks-icon.svg`): the origami falcon stooping from a scattered note into the settled disc across the falcon's-eye stone.

### 2. Changed

- Named the packages **`spreen-tracks`** per the `spreen-<function>` family naming, following the repository rename from `itunes-file-delimiter-replacers` (2026-07-17): RubyGem `spreen-tracks` (`SpreenTracks`), PyPI `spreen-tracks` (`spreen_tracks`), CLI `track-delimiter`.
- Renamed the ecosystem directories and workflow prefixes — `ruby/` → `RubyGem/` (`Ruby - *` → `RubyGem - *` workflows) and `python/` → `PyPI/` (`Python - *` → `PyPI - *`) — aligning the CI and daily-update workflows with the `rubygem--release.yml` / `pypi--release.yml` release-workflow convention.
- Progress output now always prints: the caller-stack test detection (`test_env?` / `_test_env`) is gone, and the tests capture stdout instead.
- READMEs document the packaged installation (`gem install spreen-tracks` / `pipx install spreen-tracks`), the CLI flags, and the origin of the name, and the Actions Status badges point at the renamed repository.

### 3. Removed

- Flat `ruby/src/` and `python/src/application.py` script layouts and the interactive Rake/Invoke tasks (superseded by the packages and the CLI above); the `invoke` dependency is gone.
