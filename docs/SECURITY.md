# Security Check: No Leaked Personal or Enterprise Information

This document describes how to avoid leaking secrets, personal data, or enterprise-internal information in this repo, and how to run the security check.

## What We Protect Against

| Category | Examples | Allowed |
|----------|----------|---------|
| **Secrets** | API keys, passwords, tokens, private keys, JDBC/connection strings with credentials | Env vars, placeholders like `{{API_KEY}}` |
| **Personal data** | Real emails, phone numbers, employee/customer IDs | `user@example.com`, `{{EMAIL}}`, placeholders |
| **Enterprise data** | Real DB names, schema names, internal hostnames, Jira/Confluence URLs with real project names | Generic examples: `DWH`, `{{DB_ALIAS}}`, `FACT_SALES` |

## Running the Security Check

From the **repository root**:

```bash
./scripts/security-check.sh
```

The script:

1. **Gitleaks** (if installed): Scans for secrets using `.gitleaks.toml`. Install with `brew install gitleaks`.
2. **PII / enterprise patterns**: Grep-based checks for:
   - Email addresses (except `@example.com`, `@example.org`, `@localhost`)
   - Vietnamese mobile-style phone numbers
   - Connection strings or inline passwords
   - Private key blocks (PEM)

If any check fails, fix the findings before committing. The script exits with code 1 on failure.

## Before Committing

- Run `./scripts/security-check.sh` when you change prompts, commands, docs, or config.
- Use placeholders in prompts (e.g. `prompts/lineage.md`, `prompts/discovery.md`): `{{TABLE_NAME}}`, `{{DB_ALIAS}}`, `{{WORKSPACE_ROOT}}`, etc.
- Do not paste real discovery/output (table lists, lineage, query results) that contains internal schema or environment names into committed files.

## If You Find a Leak

1. **Secrets**: Rotate the secret immediately; consider it compromised. Remove from history (e.g. BFG or `git filter-branch`) and move to env or a secret manager.
2. **PII / enterprise info**: Remove or replace with placeholders. If already in history, redact or rewrite history as per your policy.

## Configuration

- **Gitleaks**: `.gitleaks.toml` in the repo root. It extends default rules and allowlists example/placeholder text to reduce false positives.
- **Custom patterns**: Edit `scripts/security-check.sh` to add or relax patterns (e.g. allow more example domains or internal hostname patterns for CI).

## Cursor Rule

The rule `.cursor/rules/no-sensitive-data.mdc` reminds contributors and the AI to avoid committing personal or enterprise information and to use placeholders. See that file for a short checklist.
