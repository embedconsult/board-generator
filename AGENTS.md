# Agent and Contributor Guide

## Project intent
This repository is a Crystal-first hardware/documentation generator for PCB/PCBA deliverables.

## Source-of-truth policy
- Canonical authoring formats are Crystal (`.cr`) and Markdown (`.md`) with structured metadata.
- Generated artifacts must not be manually edited.
- `work/` is ephemeral for back-annotation imports and transient outputs.

## Run model
- Every automation entrypoint must be runnable using `crystal run ...`.
- Add or update specs for any feature work.
- Run `crystal run src/tasks/lint_markdown.cr` before committing documentation changes.

## Documentation model (DRY)
- Prefer a single-source board content file under `boards/<board-id>/board.md`.
- `board.md` must include sections for introduction, quick-start, design, expansion, demos, and support.
- Audience-specific generated pages can split from `board.md` during generation.
- `tutorials.md` and `slides.md` are referential docs and must not repeat board identifiers already defined canonically.
- Prefer Pandoc Markdown metadata patterns (YAML metadata blocks, fenced Div attributes, and header attributes) for clean source rendering.

## Markdown linting policy
- Linting is Crystal-native and opinionated to minimize style-only diffs.
- Required rules are documented in `README.md` and enforced by `src/tasks/lint_markdown.cr`.

## Parts library policy (KiCad best practices)
- Use project-local symbol and footprint libraries committed with the board source.
- Freeze symbol and footprint references per design revision.
- Keep 3D models pinned and versioned; avoid mutable remote references in production releases.
- Validate fields required for BOM and manufacturer handoff (MPN, value, package, DNP, substitutes).
