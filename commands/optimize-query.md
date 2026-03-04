---
name: optimize-query
description: Optimize query from EXPLAIN plan (partition, index, hints). Standalone action from pro-data-analyst Phase 6.
---

# Optimize query (Phase 6)

**Optimize** an existing query based on EXPLAIN PLAN. Use when you already have EXPLAIN output (e.g. from explain-query) and want to apply tuning without re-running the full workflow.

1. Require: **query file** and **EXPLAIN PLAN** (or run `scripts/explain_query.py --db DWH --file query.sql` first).
2. Apply optimization checklist: partition pruning, index usage, join order, avoid repeated scans; Oracle hints if needed (`/*+ PARALLEL(t,4) */`, `/*+ INDEX(t idx_name) */`).
3. Re-run EXPLAIN and, if desired, safe execution to verify. Load `references/optimization.md` for detailed guidance.

No checkpoint. Use before finalize-task when performance matters.
