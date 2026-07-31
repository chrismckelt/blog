#!/usr/bin/env bash
set -euo pipefail

echo "post-start.sh..."

WORKSPACE_DIR="${WORKSPACE_DIR:-$(pwd)}"
cd "$WORKSPACE_DIR"

# Load project .env so GIT_USERNAME/GIT_EMAIL are in scope before git config
if [ -f "$WORKSPACE_DIR/.env" ]; then
  set -a
  # shellcheck disable=SC1091
  source "$WORKSPACE_DIR/.env"
  set +a
fi

if [[ -n "${GIT_USERNAME:-}" ]]; then
  git config --global user.name "$GIT_USERNAME"
fi

if [[ -n "${GIT_EMAIL:-}" ]]; then
  git config --global user.email "$GIT_EMAIL"
fi
