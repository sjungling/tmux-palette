#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

if ! command -v fzf >/dev/null 2>&1; then
  tmux display-message "command-palette: fzf not found on PATH. Install fzf: https://github.com/junegunn/fzf#installation"
  exit 0
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTFILE="$(mktemp)"
trap 'rm -f "$OUTFILE"' EXIT

tmux display-popup -E -w 80% -h 60% -e "PALETTE_OUTFILE=$OUTFILE" "$DIR/picker.sh" || true

IFS= read -r sel < "$OUTFILE" || true
CMD="${sel%% *}"
if [ -n "$CMD" ]; then
  tmux command-prompt -T command -I "$CMD "
fi
