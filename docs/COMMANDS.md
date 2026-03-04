# Commands Catalog (Data Team)

Commands live in `commands/` with frontmatter `name` and `description`. Option "subagent" means the step can be run via `mcp_task` in a subagent. All analyst commands map to **pro-data-analyst** skill phases.

## Full workflow

| Command | Purpose | Skill / Subagent |
|---------|---------|------------------|
| **full-analysis** | Run full 7 phases (with checkpoints). | pro-data-analyst; optionally subagent only for 2/5. |
| **skip-checkpoints** | Same as full-analysis but skip 4 checkpoints. | pro-data-analyst skip mode. |

## Phase-based (composite)

| Command | Purpose | Skill / Subagent |
|---------|---------|------------------|
| **data-brief** | Create task brief (Phase 1) for a business question. | pro-data-analyst Phase 1. |
| **discover-tables** | Run Phase 2a–2c (docs + schema + prior queries). Option: subagent. | pro-data-analyst; if "subagent" → mcp_task explore/generalPurpose. |
| **run-lineage** | Run Phase 2e (lineage) for table/column. Default: subagent. | pro-data-analyst Phase 2e; prompt includes script paths + scenarios. |
| **explain-query** | EXPLAIN + run_query_safe (Phase 5). Option: subagent. | pro-data-analyst Phase 5; subagent = shell or generalPurpose. |

## Standalone actions (use flexibly)

Use these when you want a single step without running the full workflow or when chaining steps manually.

### Search (Phase 1 / 2a–2b)

| Command | Purpose |
|---------|---------|
| **search-glossary** | Search business glossary for terms/KPIs (definitions, calculation, DWH candidates). |
| **search-documents** | Search Excel metadata (DWH + source) by keyword. |
| **search-schema** | Search database schema (names and comments) by keyword. |

### Deep inspection (Phase 2d)

| Command | Purpose |
|---------|---------|
| **inspect-table** | Inspect table structure and column comments (check_table). |
| **sample-table** | Sample table data; optional profiling. |
| **find-relationships** | Find FK and join paths for one or two tables. |

### Document & query (Phase 3, 4, 5c, 6, 7)

| Command | Purpose |
|---------|---------|
| **data-mapping** | Write data mapping document from brief + discovered tables. |
| **design-query** | Design SQL from data mapping (CTEs, PII-safe); save to task folder. |
| **debug-query** | Isolate faulty CTE when result is empty/NULL or query is slow (Phase 5c). |
| **optimize-query** | Optimize from EXPLAIN (partition, index, hints). |
| **finalize-task** | Save query, update mapping, distill knowledge, write task report. |

## Subagent option

When user says "subagent" or "run discovery/lineage/explain in subagent", the main agent delegates the corresponding step to a subagent and uses the returned summary/file to continue. See [SUBAGENT-USAGE.md](SUBAGENT-USAGE.md).

## Knowledge map (domain mapping)

Proactive sessions to build a system-level knowledge map (markdown + Mermaid diagram). Uses **data-knowledge-map** skill.

| Command | Purpose |
|---------|---------|
| **map-domain** | Start a knowledge-map session: scope → discovery → relationships → system view → write `knowledge/domains/{slug}/domain.md` and `domain.mmd`. Interactive with 5 checkpoints. |
| **sync-domain-diagram** | Regenerate `domain.mmd` from current `domain.md` for a given domain slug. Use when doc was edited and diagram should match. |

## Future commands

- Scientist: e.g. `/notebook-analyze`, `/ml-pipeline`.
- Engineer: e.g. `/etl-check`, `/dwh-table-design`.
