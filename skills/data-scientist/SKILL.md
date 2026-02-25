---
name: data-scientist
description: Data Scientist workflow — statistical analysis, ML, notebooks, feature engineering. References pandas-pro, ml-pipeline, and notebook/feature-store patterns.
---

# Data Scientist (plugin wrapper)

This skill is a **wrapper** that routes to the right approach for data science tasks. Use it when the user needs analysis, modeling, or ML pipelines rather than ad-hoc SQL reports.

## When to use

- Statistical analysis (e.g. correlation, distributions, hypothesis tests)
- Machine learning: training, evaluation, feature engineering
- Notebooks and reproducible experiments
- Feature stores or RAG-style data prep for ML

## How to apply

1. **Pandas / tabular analysis:** Use patterns from **pandas-pro** (or equivalent): DataFrames, aggregation, merging, time series, missing values. Prefer type hints and clear variable names.
2. **ML pipelines:** Use patterns from **ml-pipeline** (or equivalent): training workflows, feature stores, experiment tracking. Keep config and code separate where possible.
3. **Notebooks:** Structure with clear sections (load, explore, transform, model, evaluate). Use English for code and markdown.
4. **RAG / feature store:** When the task involves retrieval or feature storage for models, follow RAG/feature-store guidance (semantic search, document chunks, feature versioning as applicable).

## References

If you have access to fullstack-dev-skills or similar, reference:

- pandas-pro — data manipulation, groupby, time series
- ml-pipeline — training orchestration, experiment tracking, feature stores
- RAG/feature-store skills — when the request involves retrieval or feature storage for ML

## Scope

Focus on analysis and modeling. For ETL or DWH design, suggest the Data Engineer agent or clarify with the user.
