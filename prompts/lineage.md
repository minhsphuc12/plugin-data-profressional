# Lineage subagent prompt (Phase 2e)

Use this as the `prompt` when calling mcp_task for table/column lineage. Replace placeholders before sending.

---

**Description (short):** Run Phase 2e lineage: find procedures/packages and ODI scenarios that use the given table/column; iterate until no new references; return lineage summary.

**Prompt:**

You are running **Phase 2e (Lineage)** for a data analytics task. The main agent needs to know where a table (or column) is used as input or output. Your job is to trace lineage using procedures and ODI scenarios only. Do not run checkpoints or talk to the user.

**Inputs:**
- Table name (and optional schema) to trace: `{{TABLE_NAME}}` (e.g. FACT_SALES), schema: `{{SCHEMA}}` (optional)
- DB alias for **procedure/package search**: `{{DB_ADMIN_ALIAS}}` (e.g. DWH_ADMIN — use this for search_procedures.py, not DWH)
- Workspace root: `{{WORKSPACE_ROOT}}`
- Path to scenarios (ODI): `{{SCENARIOS_PATH}}` (e.g. scenarios/ under workspace)

**Steps (iterate until no new names or limit ~5–10 rounds):**
1. Run: `python scripts/search_procedures.py --table {{TABLE_NAME}} --db {{DB_ADMIN_ALIAS}}` (add `--schema {{SCHEMA}}` if needed).
2. From the results, note any procedure/package/function names and any **new** table names mentioned.
3. In `{{SCENARIOS_PATH}}`, search for the current table name and the new names; note interfaces, mappings, source tables.
4. Add any new table/interface names to the working set. Repeat from step 1 for the new names.
5. Merge all rounds into one lineage view: upstream sources, downstream consumers, procedures/packages, ODI scenario context.

**Output:** Write a markdown summary to `{{OUTPUT_PATH}}` or return in your final response:
- Tables/procedures that **read** from the given table.
- Tables/procedures that **write** to the given table.
- ODI scenario/interface context if found.

Do not proceed to Phase 3 or any checkpoint.

**Placeholders to replace:**
- `{{TABLE_NAME}}`
- `{{SCHEMA}}`
- `{{DB_ADMIN_ALIAS}}`
- `{{WORKSPACE_ROOT}}`
- `{{SCENARIOS_PATH}}`
- `{{OUTPUT_PATH}}` (optional)
