# board-generator

Crystal project skeleton for generating PCB/PCBA manufacturing outputs and audience-focused documentation from Markdown + JSON annotated source.

## Quick commands
- `crystal run src/tasks/env_check.cr`
- `crystal run src/tasks/generate_board.cr -- --board example-board --variant public`
- `crystal run src/tasks/generate_docs.cr -- --board example-board`
- `crystal spec`

## Board input layout
Each board lives in `boards/<board-id>/` with these files:
- `01-introduction.md`
- `02-quick-start.md`
- `03-design.md`
- `04-expansion.md`
- `05-demos.md`
- `06-support.md`
- `tutorials.md`
- `slides.md`

## DRY documentation strategy
`03-design.md` is the technical single source of truth. Other files should reference stable section ids and JSON block identifiers from `03-design.md` instead of re-stating specs.

## Parts libraries
This skeleton adopts KiCad community-oriented practices:
- project-local libraries under version control,
- pinned symbol/footprint/3D references,
- metadata completeness for BOM and assembly pipelines.
