---
name: da-explain-query
description: Run EXPLAIN PLAN and safe execution (Phase 5). Optional subagent for isolated context.
---

# Explain and run query (Phase 5)

Run **Phase 5** of the pro-data-analyst workflow: EXPLAIN PLAN for the query file, then execute with safety limits (e.g. --limit 100, --timeout 30).

1. User must provide the **path to the query SQL file** (or it may be the current task’s query from Phase 4).
2. **If user asked for "subagent" or "run explain in subagent":**
   - Use `mcp_task` with subagent_type `shell` or `generalPurpose`. Use the prompt from `prompts/explain-and-run.md`; fill placeholders (query file path, db alias, workspace root, output path).
   - When the subagent returns, read the EXPLAIN summary and sample/count; report to the user and continue to Phase 6/7 if appropriate.
3. **Otherwise:** Run `scripts/explain_query.py --db DWH --file <query.sql>` then `scripts/run_query_safe.py --db DWH --file <query.sql> --limit 100 --timeout 30`. Summarize plan and results.
4. Check for full table scans, partition pruning, index usage; spot-check that results make sense. If issues, iterate back to Phase 4 or 6.

Do not run INSERT/UPDATE/DELETE/DDL. Use only the safe execution script with limits.
