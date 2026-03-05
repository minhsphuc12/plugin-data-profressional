---
name: da-search-glossary
description: Search business glossary for terms/KPIs. Standalone action from pro-data-analyst Phase 1.
---

# Search glossary

Search the **business glossary** for key terms, KPIs, or indicator names. Use this when you need definitions, calculation methods, or suggested DWH table/column before or without running full Phase 1.

1. Provide one or more **keywords** (terms, KPI names). Regex is on by default; use `|` for OR (e.g. `doanh thu|revenue|AMOUNT`).
2. Run: `python scripts/search_glossary.py --keyword "YOUR_TERM_OR_REGEX" --folder documents/`
3. Use results for: **Definition**, **Calculation method**, **DWH table/column** (candidates), **Domain/Owning unit**.

No checkpoint. Output is for your own use or to enrich a task brief. Folder is typically `documents/` (or path where glossary Excel files live).
