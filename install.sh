#!/usr/bin/env bash
# install.sh — Install agycmdr and backward-compatible symlinks into ~/.local/bin

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"

mkdir -p "$BIN_DIR"

install -m 0755 "$REPO_DIR/bin/agycmdr" "$BIN_DIR/agycmdr"

# Create convenient aliases/symlinks
ln -sf "$BIN_DIR/agycmdr" "$BIN_DIR/agy-search"
ln -sf "$BIN_DIR/agycmdr" "$BIN_DIR/agy-restore"
ln -sf "$BIN_DIR/agycmdr" "$BIN_DIR/restore-agy-workspaces"
ln -sf "$BIN_DIR/agycmdr" "$BIN_DIR/agyctl"

echo "✓ Installed agycmdr to $BIN_DIR/agycmdr"
echo "✓ Created symlinks: agy-search, agy-restore, restore-agy-workspaces, agyctl"

if [[ "${1:-}" == "--with-timer" ]]; then
  "$BIN_DIR/agycmdr" auto-save --enable
fi
