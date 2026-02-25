#!/usr/bin/env bash
# Security check: prevent secrets and personal/enterprise information from being committed.
# Run from repo root: ./scripts/security-check.sh
# See docs/SECURITY.md for details.

set -e
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"
FAILED=0

# Text files to scan (portable: find + grep, no --include)
scan_files() {
  find . -type f \( -name '*.md' -o -name '*.ts' -o -name '*.js' -o -name '*.py' \
    -o -name '*.json' -o -name '*.yaml' -o -name '*.yml' -o -name '*.toml' -o -name '*.mdc' \) \
    ! -path './.git/*' ! -path './node_modules/*' ! -path './.cursor/*' \
    ! -name 'security-check.sh' ! -path './.gitleaks.toml' 2>/dev/null
}

# --- 1. Gitleaks (secrets) ---
if command -v gitleaks >/dev/null 2>&1; then
  echo "[security-check] Running gitleaks..."
  if ! gitleaks detect --source . --config .gitleaks.toml --no-git --verbose 2>&1; then
    echo "[security-check] FAIL: gitleaks found potential secrets."
    FAILED=1
  fi
else
  echo "[security-check] Skip: gitleaks not installed (brew install gitleaks)."
fi

# --- 2. PII / enterprise info patterns ---
echo "[security-check] Scanning for PII and enterprise patterns..."

# Real-looking email (fail if line has @ and is not example.com/example.org/localhost)
while IFS= read -r f; do
  [ -z "$f" ] && continue
  if grep -nE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' "$f" 2>/dev/null | \
     grep -v -E 'example\.(com|org)|@localhost'; then
    echo "[security-check] FAIL: Possible real email in $f. Use placeholders (e.g. user@example.com)."
    FAILED=1
  fi
done <<< "$(scan_files)"

# Vietnamese mobile pattern (0 followed by 9 digits, prefix 3/5/7/8/9)
while IFS= read -r f; do
  [ -z "$f" ] && continue
  if grep -nE '\b0[35789][0-9]{8}\b' "$f" 2>/dev/null | grep -v -E 'example|placeholder|dummy|e\.g\.'; then
    echo "[security-check] FAIL: Possible phone number in $f. Remove or use placeholder."
    FAILED=1
  fi
done <<< "$(scan_files)"

# Connection strings / inline passwords
while IFS= read -r f; do
  [ -z "$f" ] && continue
  if grep -nE '(jdbc:|Server=|Password=|[?&]password=).*[a-zA-Z0-9_]{8,}' "$f" 2>/dev/null | \
     grep -v -E '\{\{.*\}\}|example|placeholder'; then
    echo "[security-check] FAIL: Possible connection string or password in $f. Use env or placeholders."
    FAILED=1
  fi
done <<< "$(scan_files)"

# Private key block (any file)
if find . -type f ! -path './.git/*' ! -name '*.toml' -print0 2>/dev/null | \
   xargs -0 grep -lE '-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----' 2>/dev/null; then
  echo "[security-check] FAIL: Private key block found. Never commit private keys."
  FAILED=1
fi

if [ $FAILED -eq 1 ]; then
  echo "[security-check] One or more checks failed. Fix findings before committing. See docs/SECURITY.md."
  exit 1
fi

echo "[security-check] All checks passed."
exit 0
