# Discovery subagent prompt (Phase 2a–2c)

Use this as the `prompt` (and optionally `description`) when calling mcp_task for data discovery. Replace placeholders before sending.

---

**Description (short):** Run Phase 2a–2c data discovery: search documents, schema, and prior queries; return a summary table of found tables and key columns.

**Prompt:**

You are running **Phase 2 (Data Discovery)** for a data analytics task. The main agent has already completed Phase 1 (task brief). Your job is to find relevant tables and columns only. Do not run checkpoints or talk to the user.

**Inputs (use these values):**
- Task brief or business question: `{{TASK_BRIEF_OR_QUESTION}}`
- Keywords for search (regex OK, use | for OR): `{{KEYWORDS}}`
- DB alias for schema/search: `{{DB_ALIAS}}` (e.g. DWH)
- Workspace root path: `{{WORKSPACE_ROOT}}` (e.g. absolute path to plugin-data-profressional or project root)

**Steps:**
1. Search Excel documentation: run `python scripts/search_documents.py --keyword "{{KEYWORDS}}" --folder documents/` (adjust path if scripts live under workspace).
2. Search database schema: run `python scripts/search_schema.py --keyword "{{KEYWORDS}}" --db {{DB_ALIAS}}`.
3. Search previous queries in `queries/` (or path given in workspace) for the same keywords.
4. Produce a single markdown summary with:
   - **Found tables**: table name, schema, short description, why selected.
   - **Key columns**: table, column, comment/meaning, role in query (measure/dimension/filter).

**Output:** Write the summary to a file (e.g. `{{OUTPUT_PATH}}` or a path the main agent expects) or return it in your final response so the main agent can paste it. Do not proceed to Phase 3 or any checkpoint.

**Placeholders to replace:**
- `{{TASK_BRIEF_OR_QUESTION}}`
- `{{KEYWORDS}}`
- `{{DB_ALIAS}}`
- `{{WORKSPACE_ROOT}}`
- `{{OUTPUT_PATH}}` (optional)
