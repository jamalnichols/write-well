#!/usr/bin/env bash

set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

fail=0

tracked_files=()
while IFS= read -r -d '' file; do
  case "$file" in
    scripts/repo-safety-check.sh|*-threat-model.md)
      continue
      ;;
  esac

  tracked_files+=("$file")
done < <(git ls-files -z)

if [ "${#tracked_files[@]}" -eq 0 ]; then
  echo "No tracked files found."
  exit 0
fi

run_check() {
  local label="$1"
  local pattern="$2"

  local matches
  matches="$(rg -n --color=never -e "$pattern" "${tracked_files[@]}" || true)"

  if [ -n "$matches" ]; then
    fail=1
    echo
    echo "[FAIL] $label"
    echo "$matches"
  fi
}

run_check "machine-specific paths" '/Users/|/home/|[A-Za-z]:\\\\Users\\\\'
run_check "disallowed source domains" 'z-library\\.sk|1lib\\.sk|z-lib\\.sk|z-lib\\.org'
run_check "obvious secret material" 'BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY|ghp_[A-Za-z0-9]+|github_pat_[A-Za-z0-9_]+|sk-[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z\\-_]{35}'

if [ "$fail" -ne 0 ]; then
  echo
  echo "repo-safety-check: failed"
  exit 1
fi

echo "repo-safety-check: passed"
