---
name: search-documents
description: Search Excel metadata (DWH + source) by keyword. Standalone action from pro-data-analyst Phase 2a.
---

# Search documents (Phase 2a)

Search **Excel documentation** (DWH and source-system metadata) for tables and columns matching a keyword. Use when you need to find where a concept is documented without touching the database.

1. Provide **keyword(s)**. Regex is default; use `|` for OR (e.g. `TERM_X|TERM_Y`).
2. Run: `python scripts/search_documents.py --keyword "YOUR_KEYWORD" --folder documents/`
3. Interpret results by **doc_type**: `dwh_tables`, `dwh_columns` (DWH); `source_tables`, `source_columns` (source systems). Prefer DWH for reporting; use source docs for lineage/ETL.

No checkpoint. Use output as input to schema search or deep inspection.
