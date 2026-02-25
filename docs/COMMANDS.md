# Commands Catalog (Data Team)

Commands live in `commands/` with frontmatter `name` and `description`. Option "subagent" means the step can be run via `mcp_task` in a subagent.

| Command | Purpose | Skill / Subagent |
|---------|---------|------------------|
| **data-brief** | Create task brief (Phase 1) for a business question. | pro-data-analyst Phase 1. |
| **discover-tables** | Run Phase 2a–2c (docs + schema + prior queries). Option: subagent. | pro-data-analyst; if "subagent" → mcp_task explore/generalPurpose. |
| **run-lineage** | Run Phase 2e (lineage) for table/column. Default: subagent. | pro-data-analyst Phase 2e; prompt includes script paths + scenarios. |
| **explain-query** | EXPLAIN + run_query_safe (Phase 5). Option: subagent. | pro-data-analyst Phase 5; subagent = shell or generalPurpose. |
| **full-analysis** | Run full 7 phases (with checkpoints). | pro-data-analyst; optionally subagent only for 2/5. |
| **skip-checkpoints** | Same as full-analysis but skip 4 checkpoints. | pro-data-analyst skip mode. |

## Subagent option

When user says "subagent" or "run discovery/lineage/explain in subagent", the main agent delegates the corresponding step to a subagent and uses the returned summary/file to continue. See [SUBAGENT-USAGE.md](SUBAGENT-USAGE.md).

## Future commands

- Scientist: e.g. `/notebook-analyze`, `/ml-pipeline`.
- Engineer: e.g. `/etl-check`, `/dwh-table-design`.
