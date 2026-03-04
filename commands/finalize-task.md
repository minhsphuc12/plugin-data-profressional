---
name: finalize-task
description: Save query, update mapping, distill knowledge, write task report. Standalone action from pro-data-analyst Phase 7.
---

# Finalize task (Phase 7)

**Save and document** the outcome of a task without running earlier phases. Use when the query is already written and tested and you only need to persist and report.

1. Require: **task folder**, **query file** (`{task-folder}_query.sql`), and **data mapping** (to update with final notes).
2. Save query to `queries/agent-written/{task-folder}.sql` with header comment.
3. Update `{task-folder}/{task-folder}-data-mapping.md` with final results.
4. **Knowledge distillation**: Update `knowledge/single-table/`, `knowledge/multiple-tables/`, and optionally `knowledge/glossary/` (one file per table/join/term; read existing then merge/append with date and task context). Do not write real data samples, PII, or internal identifiers.
5. Write task report `{task-folder}_README.md`: 7-phase summary, key tables/columns, performance notes, assumptions, links to created files.

No checkpoint. Use after explain-query and optionally optimize-query.
