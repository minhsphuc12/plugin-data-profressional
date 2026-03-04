# Design: Data Knowledge Map (skill + commands)

**Date:** 2025-03-04

## Goal

Enable **proactive sessions** (direction A) where the user and agent collaboratively build a **knowledge map** of a database domain — not only per-table knowledge but how the data system relates. Output: **markdown + Mermaid diagram** (direction C), kept in sync.

## Decision

- **New skill:** `data-knowledge-map` (workflow: scope → discovery → relationships → system view → write markdown + diagram; 5 checkpoints).
- **Commands:** `map-domain` (start session), `sync-domain-diagram` (regenerate diagram from domain.md).
- **No change** to pro-data-analyst; it can **read** the new `knowledge/domains/` and `knowledge/system/` when starting analysis tasks.

## Artifacts

| Path | Purpose |
|------|---------|
| `knowledge/system/` | Index of mapped domains (e.g. index.md). |
| `knowledge/domains/{domain-slug}/domain.md` | Structured markdown (tables, relationships, data flow, links to single-table/multiple-tables). |
| `knowledge/domains/{domain-slug}/domain.mmd` | Mermaid diagram (ER or flowchart) in sync with domain.md. |

## Files created/updated

- `skills/data-knowledge-map/SKILL.md` — new skill.
- `commands/map-domain.md` — start knowledge-map session.
- `commands/sync-domain-diagram.md` — sync diagram from domain.md.
- `docs/COMMANDS.md` — added "Knowledge map" section.
- `docs/SKILLS.md` — added data-knowledge-map row.
- `skills/data-analyst/SKILL.md` — added link to map-domain and data-knowledge-map.
