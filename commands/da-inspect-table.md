---
name: da-inspect-table
description: Inspect table structure and column comments. Standalone action from pro-data-analyst Phase 2d.
---

# Inspect table (Phase 2d)

Inspect **table structure and column comments** for a single table. Use after you have candidate table names from discovery.

1. Provide **schema**, **table name**, and **db alias** (e.g. DWH).
2. Run: `python scripts/check_table.py SCHEMA TABLE_NAME --db DWH`
3. Use output for: column list, data types, comments (business meaning), keys.

No checkpoint. Combine with sample-table and find-relationships for deep inspection.
