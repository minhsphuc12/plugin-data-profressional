# Agents Catalog (Data Team)

When to invoke which agent based on user intent.

| Agent | Purpose | Trigger examples |
|-------|---------|-------------------|
| **Data Analyst** | Answer business questions with SQL, reports, KPIs, discovery, lineage. | "revenue report", "find tables containing X", "lineage for table Y", "optimize query". |
| **Data Scientist** | Statistical analysis, ML, experiments, notebooks, feature/store. | "correlation analysis", "train model", "feature engineering", "ML pipeline". |
| **Data Engineer** | ETL, pipelines, DWH, orchestration, data quality, Spark/batch. | "ETL from source A", "design DWH table", "Airflow pipeline", "data quality check". |
| **Data Governance** | Domain mapping, knowledge map, data documentation (markdown + Mermaid). | "map Sales domain", "build knowledge map for Customer", "document how tables relate". |

## Links

- **Skills**: See [SKILLS.md](SKILLS.md) for which skill each agent uses.
- **Commands**: See [COMMANDS.md](COMMANDS.md) for slash commands and when to use subagent.

## Plugin agents

Agent definitions live in `agents/`:

- `agents/data-analyst.md` — Data Analyst agent (pro-data-analyst skill).
- `agents/data-scientist.md` — Data Scientist agent (data-scientist skill wrapper).
- `agents/data-engineer.md` — Data Engineer agent (data-engineer skill wrapper).
- `agents/data-governance.md` — Data Governance agent (data-knowledge-map skill).
