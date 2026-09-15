#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

get_opt() {
  local val
  val="$(tmux show-option -gqv "$1" 2>/dev/null || true)"
  echo "${val:-$2}"
}

PALETTE_KEY="$(get_opt @command-palette-key 'C-p')"

if ! command -v fzf >/dev/null 2>&1; then
  tmux bind-key -T prefix "$PALETTE_KEY" display-message "command-palette: fzf not found on PATH. Install fzf: https://github.com/junegunn/fzf#installation"
  exit 0
fi

tmux bind-key -T prefix "$PALETTE_KEY" run-shell "$CURRENT_DIR/scripts/palette.sh"
