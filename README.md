# Plugin: Data Professional (Data Team Catalog)

Cursor plugin for the data team: **Data Analyst**, **Data Scientist**, and **Data Engineer** agents, skills, and commands. Supports optional **subagent** usage so heavy steps (discovery, lineage, EXPLAIN) run in isolated context without polluting the main task.

## Contents

- **Agents:** `agents/data-analyst.md`, `data-scientist.md`, `data-engineer.md` — when to use which role.
- **Skills:** `skills/data-analyst/`, `data-scientist/`, `data-engineer/` — each has `SKILL.md` with frontmatter. Data Analyst wraps the full pro-data-analyst workflow and optional subagent usage.
- **Commands:** `commands/data-brief.md`, `discover-tables.md`, `run-lineage.md`, `explain-query.md`, `full-analysis.md`, `skip-checkpoints.md` — analyst workflow triggers; some support a "subagent" option.
- **Docs:** `docs/AGENTS.md`, `SKILLS.md`, `COMMANDS.md`, `SUBAGENT-USAGE.md` — catalog and I/O contract for subagents.
- **Prompts:** `prompts/discovery.md`, `lineage.md`, `explain-and-run.md` — templates to pass into subagent tasks (fill placeholders before use).

## Installation

Install as a Cursor plugin (e.g. from repo or local path). Ensure `.cursor-plugin/plugin.json` is present; Cursor will discover `rules/`, `skills/`, `agents/`, `commands/`, and `hooks/` by default.

## Usage

1. **Data Analyst:** Invoke by intent ("revenue report", "find tables for X", "lineage for table Y") or use a command (e.g. full-analysis, discover-tables). Say "run discovery in subagent" or "lineage via subagent" to delegate those steps.
2. **Data Scientist:** Invoke by intent ("correlation analysis", "train model", "ML pipeline"). Uses the data-scientist skill wrapper (pandas, ML, notebooks).
3. **Data Engineer:** Invoke by intent ("ETL from X", "DWH table design", "data quality check"). Uses the data-engineer skill wrapper (ETL, DWH, orchestration).

## Subagent usage

When the user asks for discovery, lineage, or EXPLAIN to run in a subagent:

- The main agent calls `mcp_task` with the appropriate prompt from `prompts/`. The prompt must be self-contained (include script paths and db alias); the subagent runs in isolated context.
- The subagent returns a summary (tables/columns, lineage, or EXPLAIN + sample). The main agent reads it and continues with the next phase or checkpoint.
- All checkpoints (1–4) remain with the main agent.

See `docs/SUBAGENT-USAGE.md` for the full contract and `docs/COMMANDS.md` for which commands support the subagent option.

## Dependencies

- **Pro-data-analyst (full skill):** For the full 7-phase analyst workflow, the skill is expected at `~/.claude/skills/pro-data-analyst/SKILL.md` (or equivalent). The plugin’s `skills/data-analyst/SKILL.md` is a wrapper that references it and adds subagent usage.
- **Scripts and data:** If your project uses `scripts/` (e.g. search_documents.py, search_schema.py, explain_query.py, run_query_safe.py, search_procedures.py), `documents/`, and `scenarios/`, ensure paths in the prompts point to the correct workspace. Subagent prompts use placeholders (e.g. `{{WORKSPACE_ROOT}}`) that the main agent must fill.

## License

See repository or plugin manifest.
