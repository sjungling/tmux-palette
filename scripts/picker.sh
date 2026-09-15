#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

: "${PALETTE_OUTFILE:?PALETTE_OUTFILE must be set}"

tmux list-commands | fzf --prompt="tmux> " --height=100% --layout=reverse --no-preview > "$PALETTE_OUTFILE"
