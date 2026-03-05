---
name: da-skip-checkpoints
description: Run full 7-phase analysis without stopping at the 4 checkpoints (pro-data-analyst skip mode).
---

# Full analysis (skip checkpoints)

Run the **full pro-data-analyst workflow** in **skip mode**: execute all 7 phases without pausing for user confirmation at checkpoints. Still produce the same summaries (brief, table list, data mapping, query logic) inline so the user can review afterward.

- **Phase 1:** Requirement analysis, brief, glossary. Do not wait for confirmation.
- **Phase 2:** Data discovery. Optionally use subagent for 2a–2c or 2e (see `da-discover-tables`, `da-run-lineage`).
- **Phase 3:** Data mapping.
- **Phase 4:** Query design.
- **Phase 5:** EXPLAIN and safe run. Optionally use subagent (see `da-explain-query`).
- **Phase 6:** Optimization.
- **Phase 7:** Save and document.

User can re-enable checkpoints later by saying "enable checkpoints" or similar in a new request.
