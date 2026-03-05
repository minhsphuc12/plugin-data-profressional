---
name: da-data-brief
description: Create task brief (Phase 1) for a business question. Uses pro-data-analyst Phase 1 only.
---

# Data brief (Phase 1)

Create the task brief for a data analytics request. This is **Phase 1** of the pro-data-analyst workflow only.

1. Restate the business question and define the expected output (columns, format).
2. Create task name and folder: `{YYYY-MM-DD}_{task-name}/`.
3. Consult business glossary for key terms/KPIs (e.g. `scripts/search_glossary.py --keyword "..." --folder documents/`).
4. Consult `knowledge/glossary/` for accumulated term files if they exist.
5. Write the brief to `{task-folder}/{task-folder}-brief.md` (see skill template: Glossary definitions, Expected output, Data modules, Filters & scope, Assumptions).
6. Present the brief and run **[CHECKPOINT 1]** (confirm requirements with the user). Do not proceed to Phase 2 until the user approves.

No subagent is used for this command; it is interactive.
