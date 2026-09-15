#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PALETTE_KEY="$(tmux show-option -gqv @command-palette-key)"
PALETTE_KEY="${PALETTE_KEY:-C-p}"

tmux bind-key -T prefix "$PALETTE_KEY" run-shell "$CURRENT_DIR/scripts/palette.sh"
