# Using Data Commands in Another Project

How to use the Data Team commands (e.g. `da-search-glossary`, `da-full-analysis`, `dk-map-domain`) directly in Cursor when working in a **different project** (not this plugin repo).

## Option 1: Install as a Cursor plugin (recommended)

If the plugin is published to the [Cursor Marketplace](https://cursor.com/marketplace) or your Team Marketplace:

1. Open the **other project** in Cursor.
2. Open the marketplace (e.g. **Settings → Plugins** or marketplace panel).
3. Search for **plugin-data-professional** (or your team marketplace).
4. Install and choose scope:
   - **Project**: commands only in that workspace.
   - **User**: commands available in every project.

After install, Cursor discovers `rules/`, `commands/`, `skills/`, `agents/` from the plugin. Type the command name in chat (e.g. `da-search-glossary revenue`) and the agent will run it.

---

## Option 2: Copy rule + commands into the other project (no marketplace)

Use this when the plugin is not on the marketplace (e.g. local or private repo).

### Step 1: Rule so the agent recognizes commands

In the **other project**, create a Cursor rule that tells the agent to resolve and run these commands.

Create file: **`<other-project>/.cursor/rules/commands-catalog.mdc`**

Content (adjust the `COMMANDS_DIR` path if you use a different layout):

```markdown
---
description: Resolve and run Data Team commands from commands/ or from plugin path
alwaysApply: true
---

# Commands in Cursor (Data Team)

Commands are invoked in chat by name (e.g. da-search-glossary, da-full-analysis). When the user message contains a known command name:

1. **Resolve**: Match to the command file. Look in this order:
   - `<this-workspace>/.cursor/commands/<name>.md` if it exists
   - Else `<path-to-plugin-repo>/commands/<name>.md` (see below)
2. **Read**: Load the full content (frontmatter + body) from that file.
3. **Execute**: Follow the instructions in the file (skill phases, scripts, checkpoints). Use the user's remaining message as arguments (e.g. keywords, business question).

Known command names: da-search-glossary, da-search-documents, da-search-schema, da-data-brief, da-discover-tables, da-run-lineage, da-explain-query, da-full-analysis, da-skip-checkpoints, da-inspect-table, da-sample-table, da-find-relationships, da-data-mapping, da-design-query, da-debug-query, da-optimize-query, da-finalize-task, dk-map-domain, dk-sync-domain-diagram.

If using a path to the plugin repo, set it once (e.g. in this rule or in a shared env). Example path: `/absolute/path/to/plugin-data-profressional/commands`.
```

If you **copy** the commands into the other project (see Step 2), the agent only needs to look in `<this-workspace>/commands/` and you do not need a path to the plugin repo.

### Step 2a: Copy commands into the other project

1. Copy the whole **`commands/`** folder from this repo into the other project, e.g.:
   - `<other-project>/commands/`
2. Ensure the rule above looks for `commands/<name>.md` **inside the other project** (e.g. `<this-workspace>/commands/`). No plugin path needed.

Result: the other project is self-contained. Commands run there; scripts and paths in the command files refer to the **other** project (e.g. `scripts/`, `documents/`). You may need to copy or adapt `scripts/`, `documents/`, `prompts/` there too for full behavior.

### Step 2b: Point to this repo (no copy)

1. Clone or have this plugin repo available at a fixed path (e.g. `~/git/plugin-data-profressional`).
2. In the rule in the other project, set the path to the plugin’s **commands** folder, e.g. `~/git/plugin-data-profressional/commands`.
3. The agent will **read** command files from the plugin repo and execute steps in the **current** workspace (the other project). Scripts like `scripts/search_glossary.py` must either exist in the other project or you must run them from the plugin path and pass the other project’s paths as arguments.

---

## Option 3: Git submodule or symlink (advanced)

- Add this repo as a **submodule** under the other project (e.g. `other-project/vendor/plugin-data-profressional`), then use **Option 2** with path `vendor/plugin-data-profressional/commands`.
- Or **symlink**:
  - `other-project/commands` → `../plugin-data-profressional/commands`
  - and add the same rule as in Option 2 so the agent resolves `commands/<name>.md` inside the other workspace.

---

## Dependencies in the other project

For commands to work fully in another project, that project may need:

| Need | Purpose |
|------|--------|
| **pro-data-analyst skill** | Full analyst workflow; usually at `~/.claude/skills/pro-data-analyst/` (user-level). |
| **data-knowledge-map skill** | For `dk-map-domain`, `dk-sync-domain-diagram`; can be in plugin or `~/.claude/skills/`. |
| **Scripts** | e.g. `search_glossary.py`, `search_schema.py`, `check_table.py` — copy to the other project’s `scripts/` or point to plugin and pass workspace. |
| **Data / config** | `documents/` (glossary Excel), DB config, `scenarios/` — copy or symlink as needed. |

If you only need “light” commands (e.g. `da-data-brief`, `da-design-query`) that don’t call scripts, copying the rule + `commands/` (Option 2a) is often enough; the agent will use skills from your user directory.

---

## Summary

| Goal | Action |
|------|--------|
| Use in any project, minimal setup | **Option 1**: Install plugin from marketplace (project or user scope). |
| Use in one other project without marketplace | **Option 2a**: Copy `.cursor/rules/commands-catalog.mdc` + `commands/` into that project; add scripts/data if needed. |
| Use in one other project without copying commands | **Option 2b**: Add rule in the other project that points to this repo’s `commands/` path. |
| Reuse one copy of the plugin for several projects | **Option 3**: Submodule or symlink + rule pointing at plugin `commands/`. |

After setup, in the other project open Cursor Chat and type the command name (and any arguments), e.g. `da-search-glossary revenue` or `da-full-analysis` then provide the business question when asked.
