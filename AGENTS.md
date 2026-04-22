# Agent and Contributor Guide

## Project intent
This repository is a Crystal-first hardware/documentation generator for PCB/PCBA deliverables.

## Source-of-truth policy
- Canonical authoring formats are Crystal (`.cr`) and Markdown (`.md`) with JSON annotations.
- Generated artifacts must not be manually edited.
- `work/` is ephemeral for back-annotation imports and transient outputs.

## Run model
- Every automation entrypoint must be runnable using `crystal run ...`.
- Add or update specs for any feature work.

## Documentation model (DRY)
- Prefer single-source design data under `boards/<board-id>/03-design.md`.
- Audience-specific docs reference design anchors/ids rather than duplicating content.
- Required board docs:
  - `01-introduction.md`
  - `02-quick-start.md`
  - `03-design.md`
  - `04-expansion.md`
  - `05-demos.md`
  - `06-support.md`
  - `tutorials.md`
  - `slides.md`

## Parts library policy (KiCad best practices)
- Use project-local symbol and footprint libraries committed with the board source.
- Freeze symbol and footprint references per design revision.
- Keep 3D models pinned and versioned; avoid mutable remote references in production releases.
- Validate fields required for BOM and manufacturer handoff (MPN, value, package, DNP, substitutes).
