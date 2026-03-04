---
name: data-analyst
description: Data Analyst workflow — business questions with SQL, discovery, lineage, reports. Use pro-data-analyst full skill when available; supports optional subagent for Phase 2 and Phase 5.
---

# Data Analyst (plugin wrapper)

This skill is a **wrapper** for the full **pro-data-analyst** workflow. When the full skill is available (e.g. at `~/.claude/skills/pro-data-analyst/SKILL.md`), load it and follow its 7-phase workflow and 4 checkpoints.

## When to use

- Answering business questions that require querying databases
- Finding tables/columns, building reports, optimizing queries, tracing lineage

## Subagent usage (optional)

When the user asks to run discovery, lineage, or EXPLAIN in a **subagent** (e.g. "discovery in subagent", "lineage via subagent"):

- **Phase 2a–2c (discovery):** Delegate to subagent (explore or generalPurpose). Use `prompts/discovery.md` with placeholders filled. Subagent returns tables/columns summary; you present it and run **[CHECKPOINT 2]**.
- **Phase 2e (lineage):** Delegate to subagent (generalPurpose). Use `prompts/lineage.md`. Subagent returns lineage summary.
- **Phase 5 (EXPLAIN + run):** Delegate to subagent (shell or generalPurpose). Use `prompts/explain-and-run.md`. Subagent returns plan summary and sample rows.

All checkpoints stay with the main agent. See `docs/SUBAGENT-USAGE.md` for the full I/O contract and `docs/COMMANDS.md` for command list.

## Plugin commands

**Full / phase-based:** data-brief, discover-tables, run-lineage, explain-query, full-analysis, skip-checkpoints.

**Standalone actions (use flexibly):** search-glossary, search-documents, search-schema; inspect-table, sample-table, find-relationships; data-mapping, design-query, debug-query, optimize-query, finalize-task.

See `commands/` and `docs/COMMANDS.md`.
