---
name: da-find-relationships
description: Find FK and join paths for one or more tables. Standalone action from pro-data-analyst Phase 2d.
---

# Find relationships (Phase 2d)

Find **foreign key and join paths** for a table or between two tables. Use when designing JOINs.

1. One table: `python scripts/find_relationships.py --schema SCHEMA --table TABLE_NAME --db DWH`
2. Two tables: `python scripts/find_relationships.py --schema SCHEMA --tables TABLE1,TABLE2 --db DWH`
3. Use output for join conditions and relationship type.

No checkpoint. Feed results into data mapping and query design.
