# board-generator

Crystal project skeleton for generating PCB/PCBA manufacturing outputs and audience-focused documentation from Markdown source.

## Quick commands
- `crystal run src/tasks/env_check.cr`
- `crystal run src/tasks/generate_board.cr -- --board <board-id> --variant public`
- `crystal run src/tasks/generate_docs.cr -- --board <board-id>`
- `crystal run src/tasks/lint_markdown.cr`
- `crystal spec`

## Board input layout
Each board lives in `boards/<board-id>/` with these source files:
- `board.md` (single source sections: introduction, quick-start, design, expansion, demos, support)
- `tutorials.md`
- `slides.md`

## Strict Pandoc Markdown contract
All board docs must use Pandoc-friendly Markdown with YAML front matter.

### 1) `board.md` (canonical)
```yaml
---
board: <board-id>
doc: board
canonical: true
---
```

### 2) `tutorials.md` and `slides.md` (referential)
```yaml
---
doc: tutorials|slides
purpose: <purpose-string>
---
```

Do **not** repeat `board: <board-id>` in non-canonical files; board identity is implied by directory and canonical `board.md`.

### 3) Section metadata
Use Pandoc fenced Div attributes:

```markdown
::: {.section-meta section="design" purpose="usage-and-modification"}
Canonical design metadata for this section.
:::
```

## Opinionated linting (Crystal)
Run `crystal run src/tasks/lint_markdown.cr` before committing. Current rules enforce:
- YAML front matter required in every `boards/**/*.md` file,
- `board.md` must define `board`, `doc: board`, and `canonical: true`,
- non-canonical docs must not include a `board` field,
- non-canonical docs must define `doc` and `purpose`,
- no trailing whitespace.

## Parts libraries
This skeleton adopts KiCad community-oriented practices:
- project-local libraries under version control,
- pinned symbol/footprint/3D references,
- metadata completeness for BOM and assembly pipelines.
