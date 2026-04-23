# board-generator

Crystal project skeleton for generating PCB/PCBA manufacturing outputs and audience-focused documentation from Markdown source.

## Quick commands
- `crystal run src/tasks/env_check.cr`
- `crystal run src/tasks/generate_board.cr -- --board example-board --variant public`
- `crystal run src/tasks/generate_docs.cr -- --board example-board`
- `crystal spec`

## Board input layout
Each board lives in `boards/<board-id>/` with these source files:
- `board.md` (single source sections: introduction, quick-start, design, expansion, demos, support)
- `tutorials.md`
- `slides.md`

## DRY documentation strategy
`board.md` is the single source of truth for docs sections 01-06. Generated outputs can split these sections into audience-specific pages.

## Pandoc Markdown metadata style
Use Pandoc-native constructs for clean source and robust parsing:
- YAML metadata blocks for document metadata,
- fenced Div attributes for section-scoped metadata,
- optional header attributes for stable anchors.

Example:

```markdown
::: {.section-meta section="design" purpose="usage-and-modification" id="design"}
Canonical design metadata for this section.
:::
```

## Parts libraries
This skeleton adopts KiCad community-oriented practices:
- project-local libraries under version control,
- pinned symbol/footprint/3D references,
- metadata completeness for BOM and assembly pipelines.
