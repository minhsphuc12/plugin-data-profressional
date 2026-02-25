# Subagent Usage (Pro-Data-Analyst)

When to delegate steps to a subagent and the I/O contract. Subagents run in isolated context; the main agent only keeps the returned summary/file.

## When to use subagent

| Step | Use subagent? | subagent_type | Input | Output |
|------|----------------|---------------|--------|--------|
| Phase 2a–2c (discovery) | Yes | explore or generalPurpose | task brief, keywords, db alias, paths to scripts/documents | Markdown or table: found tables/columns |
| Phase 2d (deep inspection) | Optional | generalPurpose | schema, table, db alias, script paths | Structure + sample |
| Phase 2e (lineage) | Yes | generalPurpose | table/column, db alias (DWH_ADMIN for procedures), scenarios/ path | Lineage summary (procedures + ODI) |
| Phase 5 (EXPLAIN + run) | Yes | shell or generalPurpose | path to query SQL, db alias | EXPLAIN result + sample rows (or count) |

## Contract (general)

- **Input**: Task brief (or relevant excerpt), keyword/schema/table, db alias, workspace path to `scripts/`, `documents/`, `scenarios/`. Prompt must be self-contained (subagent has no access to parent skill).
- **Output**: File (e.g. `{task-folder}/discovery-result.md`) or inline summary: tables/columns list, or lineage view, or EXPLAIN + sample.

## Prompt templates

Use the contents of:

- `prompts/discovery.md` — for Phase 2a–2c.
- `prompts/lineage.md` — for Phase 2e.
- `prompts/explain-and-run.md` — for Phase 5.

Fill placeholders (keywords, schema, table, db alias, paths) before passing to `mcp_task`. Main agent reads the subagent result and continues with the next phase or checkpoint.

## run_in_background

Optional: set `run_in_background: true` when the main agent can continue other work; collect the result later via the returned output path or summary.

## Checkpoints

All checkpoints (1–4) are presented by the **main agent**; the subagent never confirms with the user. After receiving subagent output, the main agent presents the finding and runs the checkpoint as usual.
