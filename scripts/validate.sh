#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

ruby -e 'require "yaml"; Dir.glob("{.github/workflows,examples}/**/*.{yml,yaml}").each { |f| YAML.parse_file(f); puts "yaml: #{f}" }'

if command -v actionlint >/dev/null 2>&1; then
  actionlint
else
  echo "actionlint not installed; skipped GitHub Actions semantic validation"
fi
