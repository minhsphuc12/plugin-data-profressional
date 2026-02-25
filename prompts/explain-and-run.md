# Explain and run subagent prompt (Phase 5)

Use this as the `prompt` when calling mcp_task for EXPLAIN PLAN and safe query execution. Replace placeholders before sending.

---

**Description (short):** Run Phase 5: EXPLAIN PLAN for the given query file, then execute with safety limits; return plan summary and sample rows (or row count).

**Prompt:**

You are running **Phase 5 (Query testing)** for a data analytics task. The main agent has a final or draft query. Your job is to run EXPLAIN PLAN and then a safe execution only. Do not run checkpoints or talk to the user.

**Inputs:**
- Path to the query SQL file: `{{QUERY_FILE_PATH}}` (absolute or relative to workspace)
- DB alias for execution: `{{DB_ALIAS}}` (e.g. DWH)
- Workspace root (where scripts live): `{{WORKSPACE_ROOT}}`

**Steps:**
1. Run EXPLAIN: `python scripts/explain_query.py --db {{DB_ALIAS}} --file {{QUERY_FILE_PATH}}`. Summarize: partition pruning, full table scans, index usage, cost.
2. Run safe execution with limit: `python scripts/run_query_safe.py --db {{DB_ALIAS}} --file {{QUERY_FILE_PATH}} --limit 100 --timeout 30`. If needed, run with `--count-only` for total rows.
3. Produce a short markdown report:
   - EXPLAIN summary (any issues or OK).
   - Row count or sample row count.
   - Any errors or warnings.

**Output:** Write to `{{OUTPUT_PATH}}` or return in your final response. Do not modify the query or proceed to Phase 6/7.

**Placeholders to replace:**
- `{{QUERY_FILE_PATH}}`
- `{{DB_ALIAS}}`
- `{{WORKSPACE_ROOT}}`
- `{{OUTPUT_PATH}}` (optional)
