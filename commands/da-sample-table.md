---
name: da-sample-table
description: Sample table data and optionally run profiling. Standalone action from pro-data-analyst Phase 2d.
---

# Sample table (Phase 2d)

**Sample data** from a table to understand content and value patterns. Optionally run **data profiling** on key columns.

1. Provide **schema**, **table name**, and **db alias** (e.g. DWH).
2. Sample only: `python scripts/sample_data.py --schema SCHEMA --table TABLE_NAME --db DWH`
3. With profiling: `python scripts/sample_data.py --schema SCHEMA --table TABLE_NAME --db DWH --profile`

No checkpoint. Use to validate column meaning, nulls, and edge cases before writing the query.
