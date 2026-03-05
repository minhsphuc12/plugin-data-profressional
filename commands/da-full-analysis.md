---
name: da-full-analysis
description: Run full 7-phase pro-data-analyst workflow with all 4 checkpoints. Optionally use subagent only for Phase 2 or 5.
---

# Full analysis (7 phases with checkpoints)

Run the **complete pro-data-analyst workflow**: all 7 phases and 4 checkpoints. Follow the skill’s 7-phase order and stop at each checkpoint for user confirmation.

- **Phase 1:** Requirement analysis, brief, glossary → **[CHECKPOINT 1]**.
- **Phase 2:** Data discovery (2a–2c, optionally 2d, 2e if lineage needed). Optionally delegate 2a–2c or 2e to a subagent (see `discover-tables` and `run-lineage` commands). → **[CHECKPOINT 2]**.
- **Phase 3:** Data mapping document → **[CHECKPOINT 3]**.
- **Phase 4:** Query design (CTEs, comments, PII-safe) → **[CHECKPOINT 4]**.
- **Phase 5:** EXPLAIN PLAN and safe execution. Optionally delegate to subagent (see `explain-query` command).
- **Phase 6:** Optimization if needed.
- **Phase 7:** Save query to `queries/agent-written/`, update data mapping, distill knowledge, write task report.

If the user said "use subagent for discovery" or "use subagent for Phase 5", delegate only those steps; all checkpoints are still presented by the main agent.
