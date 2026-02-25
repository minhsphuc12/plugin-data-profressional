---
name: discover-tables
description: Run Phase 2a–2c data discovery (docs, schema, prior queries). Optional subagent for isolated context.
---

# Discover tables (Phase 2a–2c)

Run **Phase 2a–2c** of the pro-data-analyst workflow: search documents, database schema, and prior queries to find relevant tables and columns.

1. Ensure Phase 1 (task brief) is done and **[CHECKPOINT 1]** is confirmed.
2. **If user asked for "subagent" or "run discovery in subagent":**
   - Use `mcp_task` with subagent_type `explore` or `generalPurpose`.
   - Use the prompt from `prompts/discovery.md`; fill placeholders (task brief, keywords, db alias, workspace root, output path).
   - When the subagent returns, read the discovery result (file or summary), then present it and run **[CHECKPOINT 2]** (confirm tables/columns with the user).
3. **Otherwise (no subagent):** Run search_documents, search_schema, and search over queries/ yourself; build the tables/columns summary; present and run **[CHECKPOINT 2]**.

Do not proceed to Phase 3 until the user confirms the table/column selection.
