---
name: data-mapping
description: Write data mapping document from brief and discovered tables. Standalone action from pro-data-analyst Phase 3.
---

# Data mapping (Phase 3)

Create the **data mapping document** only. Use when you already have a task brief and a confirmed list of tables/columns (e.g. after discover-tables and **[CHECKPOINT 2]**).

1. Require: **task folder** (e.g. `{YYYY-MM-DD}_{task-name}`) and **confirmed tables/columns** from discovery.
2. Create `{task-folder}/{task-folder}-data-mapping.md` with:
   - Tables used (schema.table, description, est. rows, partitioned?)
   - Column mapping (table, column, comment/meaning, role, data type)
   - Join conditions (from, to, condition, type)
   - Filters & business rules
   - Data quality notes, assumptions
3. If used in a full workflow, present and run **[CHECKPOINT 3]** (confirm joins, filters, business rules). If this is a standalone action, present the mapping for user review without blocking.

See pro-data-analyst Phase 3 template for the exact markdown structure.
