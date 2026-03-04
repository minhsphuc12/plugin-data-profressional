---
name: sync-domain-diagram
description: Regenerate the Mermaid diagram for a domain from its current domain.md. Use after editing domain.md or when diagram and doc are out of sync.
---

# Sync domain diagram

Update the **Mermaid diagram** (`domain.mmd`) for a domain so it matches the current **domain.md** (tables and relationships).

1. **Require:** Domain slug (e.g. `sales`, `customer`) or path `knowledge/domains/{domain-slug}/`.
2. **Read** `knowledge/domains/{domain-slug}/domain.md` and extract:
   - Core tables (schema.table, role)
   - Relationships (from, to, join/relationship)
   - Data flow (if described)
3. **Write or overwrite** `knowledge/domains/{domain-slug}/domain.mmd` with a Mermaid diagram (ER or flowchart) that reflects the same tables and relationships. Use the same naming as in the doc.
4. **Confirm** to the user: "Updated domain.mmd for {domain-slug}; diagram now matches domain.md."

Use when the user has edited `domain.md` and wants the diagram refreshed, or when the diagram and doc are out of sync. No checkpoint; single action.
