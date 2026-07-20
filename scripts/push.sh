#!/usr/bin/env bash
# Capture edits to managed files, commit them, and push to GitHub.
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
branch="master"

# Copy any edits made directly in $HOME back into the chezmoi source state.
chezmoi -S "$repo_dir" re-add

git -C "$repo_dir" add -A
if git -C "$repo_dir" diff --cached --quiet; then
    echo "Nothing to commit."
    exit 0
fi

message="${1:-Update dotfiles}"
git -C "$repo_dir" commit -m "$message"
git -C "$repo_dir" pull --rebase origin "$branch"
git -C "$repo_dir" push origin "HEAD:$branch"
