#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTFILE="$(mktemp)"
trap 'rm -f "$OUTFILE"' EXIT

tmux display-popup -E -w 80% -h 60% -e "PALETTE_OUTFILE=$OUTFILE" "$DIR/picker.sh" || true

if [ -s "$OUTFILE" ]; then
  CMD="$(head -n1 "$OUTFILE" | awk '{print $1}')"
  if [ -n "$CMD" ]; then
    tmux command-prompt -T command -I "$CMD "
  fi
fi
