---
name: da-design-query
description: Design SQL query from data mapping (CTEs, comments, PII-safe). Standalone action from pro-data-analyst Phase 4.
---

# Design query (Phase 4)

**Write the SQL query** from an existing data mapping. Use when you already have `{task-folder}-data-mapping.md` and do not need to run discovery or checkpoints.

1. Require: **task folder** and **data mapping file** (`{task-folder}-data-mapping.md`).
2. Apply Phase 4 rules: CTEs, inline comments, early filtering (partition keys), explicit NULL handling, set-based operations, **no PII in SELECT** (aggregations only if needed). Use header comment (purpose, author, date, tables, filters).
3. Save to `{task-folder}/{task-folder}_query.sql`.
4. If used in full workflow, present query logic and run **[CHECKPOINT 4]**. Standalone: present logic summary for review.

Do not execute the query in this action; use da-explain-query or run_query_safe separately.
