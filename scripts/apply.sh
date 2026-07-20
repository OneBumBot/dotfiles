#!/usr/bin/env bash
# Apply this repository's chezmoi source state to the home directory.
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
exec chezmoi -S "$repo_dir" apply "$@"
