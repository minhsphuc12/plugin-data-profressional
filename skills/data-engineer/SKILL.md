---
name: data-engineer
description: Data Engineer workflow — ETL, pipelines, DWH design, orchestration, data quality. References database-optimizer, devops-engineer, spark-engineer, dwh-patterns.
---

# Data Engineer (plugin wrapper)

This skill is a **wrapper** that routes to the right approach for data engineering tasks. Use it when the user needs ETL, pipelines, DWH design, or data quality rather than ad-hoc analytics.

## When to use

- ETL design or implementation (source to DWH or between systems)
- Data pipeline code (batch or streaming)
- DWH schema design (tables, keys, partitioning)
- Orchestration (e.g. Airflow, cron, workflow engines)
- Data quality checks and monitoring
- Spark or other batch/streaming frameworks

## How to apply

1. **DWH design:** Use **dwh-patterns** (or equivalent): star schema, fact/dimension tables, SCD, partitioning. Document table purpose and key columns.
2. **ETL / pipelines:** Use **devops-engineer** and pipeline patterns: idempotency, error handling, logging. Prefer config-driven where possible.
3. **Database tuning:** Use **database-optimizer** (or equivalent) for index design, query tuning, and partition strategy when the task involves performance.
4. **Spark / batch:** Use **spark-engineer** (or equivalent) for DataFrame API, partitioning, and resource tuning when the task involves Spark or similar engines.

## References

If you have access to fullstack-dev-skills or similar, reference:

- database-optimizer — indexes, query plans, partitioning
- devops-engineer — CI/CD, containers, pipeline patterns
- spark-engineer — Spark SQL, DataFrames, tuning
- dwh-patterns — star schema, SCD, ETL patterns

## Scope

Focus on movement and storage of data. For one-off SQL reports or KPI definitions, suggest the Data Analyst agent or clarify with the user.
