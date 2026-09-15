#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTFILE="$(mktemp)"
trap 'rm -f "$OUTFILE"' EXIT

tmux display-popup -E -w 80% -h 60% -e "PALETTE_OUTFILE=$OUTFILE" "$DIR/picker.sh" || true

if [ -s "$OUTFILE" ]; then
  CMD="$(awk '{print $1}' "$OUTFILE")"
  if [ -n "$CMD" ]; then
    tmux command-prompt -T command -I "$CMD "
  fi
fi
