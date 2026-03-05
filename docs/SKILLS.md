# Skills Catalog (Data Team)

Skills are in `skills/<name>/SKILL.md`. Each has frontmatter `name` and `description`.

| Persona | Skill | Source / Notes |
|---------|--------|----------------|
| **Analyst** | pro-data-analyst | Full skill at `~/.claude/skills/pro-data-analyst/SKILL.md`. Plugin has wrapper at `skills/data-analyst/SKILL.md` with "Subagent usage" and link. |
| **Analyst** | (optional) quick-query | Light flow: discovery + draft query, fewer checkpoints; can be wrapped in a command. |
| **Knowledge map** | data-knowledge-map | Proactive domain-mapping sessions: scope → discovery → relationships → system view → markdown + Mermaid. In `skills/data-knowledge-map/SKILL.md`. Commands: dk-map-domain, dk-sync-domain-diagram. |
| **Scientist** | data-scientist | Wrapper in `skills/data-scientist/SKILL.md`; references pandas-pro, ml-pipeline, RAG/feature store from fullstack-dev-skills. |
| **Engineer** | data-engineer | Wrapper in `skills/data-engineer/SKILL.md`; references database-optimizer, devops-engineer, spark-engineer, dwh-patterns. |

## Subagent usage (Analyst)

For pro-data-analyst, optional subagent steps:

- **Phase 2a–2c** (discovery): Run in subagent (explore or generalPurpose).
- **Phase 2e** (lineage): Run in subagent (generalPurpose).
- **Phase 5** (EXPLAIN + run_query_safe): Run in subagent (shell or generalPurpose).

See [SUBAGENT-USAGE.md](SUBAGENT-USAGE.md) for I/O contract and prompt templates.
