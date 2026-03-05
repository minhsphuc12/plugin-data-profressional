---
name: da-debug-query
description: Isolate faulty CTE when query returns empty/NULL or runs too slow. Standalone action from pro-data-analyst Phase 5c.
---

# Debug query (Phase 5c)

**Isolate the faulty CTE** when the query has abnormal results: 0 rows, important columns all NULL, or timeout/very slow. Use after da-explain-query or run_query_safe shows a problem.

1. Require: **query file** (with CTEs) and **db alias**. User should specify symptom: **empty/NULL** or **slow**.
2. **Empty result or key columns all NULL (bottom-up):** Remove or bypass the **last** CTE layer; run the shortened query. If rows/non-null appear, the removed CTE (or step feeding it) is the cause. Repeat by removing the next-to-last CTE until the problem disappears.
3. **Query too slow (top-down):** Run from the **first** CTE downward (e.g. `SELECT * FROM first_cte WHERE ROWNUM <= N` or `LIMIT N`). Add the next CTE, then the next; the first step that becomes slow is the bottleneck (table scan, missing partition pruning, heavy join).
4. Report which CTE or step is at fault. User or main agent can then fix the query or data mapping and re-run Phase 5.

Optional: delegate to subagent (generalPurpose) with query path, db alias, and symptom; subagent returns isolation result. No checkpoint.
