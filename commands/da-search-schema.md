---
name: da-search-schema
description: Search database schema metadata (names and comments) by keyword. Standalone action from pro-data-analyst Phase 2b.
---

# Search schema (Phase 2b)

Search **database schema metadata** (table/column names and comments) for a keyword. Critical for understanding business meaning of columns.

1. Provide **keyword(s)** and **db alias** (e.g. DWH). Regex is default; use `|` for OR.
2. Run: `python scripts/search_schema.py --keyword "YOUR_KEYWORD" --db DWH`
3. Optional: restrict to comments or schema: `--search-in comments --schema OWNER`.

No checkpoint. Combine with search-documents and prior queries for full discovery.
