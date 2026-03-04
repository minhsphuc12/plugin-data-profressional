---
name: map-domain
description: Start a proactive knowledge-map session for a database domain. Uses data-knowledge-map skill; interactive with checkpoints.
---

# Map domain (knowledge map session)

Start a **proactive session** to build a knowledge map of a database domain (e.g. Sales, Customer). The agent follows the **data-knowledge-map** skill and interacts with you step by step.

1. **Load the skill:** Use the workflow in `skills/data-knowledge-map/SKILL.md`.
2. **Scope:** Agree on domain name, schema(s), and whether to extend an existing map or start new (Step 1 → [MAP CHECKPOINT 1]).
3. **Discovery:** Search schema/documents for tables and columns; confirm candidate table list (Step 2 → [MAP CHECKPOINT 2]).
4. **Relationships:** Run find_relationships for the confirmed tables; confirm join paths and data flow (Step 3 → [MAP CHECKPOINT 3]).
5. **System view:** Draft and confirm the narrative (purpose, core tables, relationships, data flow) (Step 4 → [MAP CHECKPOINT 4]).
6. **Write and sync:** Create or update `knowledge/domains/{domain-slug}/domain.md` and `domain.mmd`; optionally update `knowledge/system/index.md` (Step 5 → [MAP CHECKPOINT 5]).

Result: structured markdown (detail, searchable) and a Mermaid diagram (overview) for the domain, kept in sync. No subagent; all checkpoints are with the main agent.
