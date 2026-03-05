---
name: da-run-lineage
description: Run Phase 2e lineage for a table/column. Default is to use a subagent for isolated context.
---

# Run lineage (Phase 2e)

Run **Phase 2e** of the pro-data-analyst workflow: trace where the given table (or column) is used as input or output, via procedures/packages and ODI scenarios.

1. User must provide the **table name** (and optionally schema) to trace.
2. **Default: use a subagent.** Call `mcp_task` with subagent_type `generalPurpose`. Use the prompt from `prompts/lineage.md`; fill placeholders (table name, schema, DWH_ADMIN alias, workspace root, scenarios path, output path). The subagent will iterate search_procedures.py and scenarios/ and return a lineage summary.
3. **If user said "no subagent":** Run the iterative lineage yourself (search_procedures with --db DWH_ADMIN, then scan scenarios/; repeat for new table names until no new references or limit).
4. Present the lineage result. This feeds into data mapping or documentation; no separate checkpoint for lineage-only runs. If this is part of a full analysis, continue to Phase 3 after **[CHECKPOINT 2]** (which may already have included the table list).

Scripts: `scripts/search_procedures.py --table TABLE_NAME --db DWH_ADMIN`. Scenarios folder: `scenarios/`.
