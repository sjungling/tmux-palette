#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

: "${PALETTE_OUTFILE:?PALETTE_OUTFILE must be set}"

tmux list-commands | while IFS= read -r line; do
  name="${line%% *}"
  rest="${line#"$name"}"
  rest="${rest# }"
  if [[ "$rest" == \(*\)* ]]; then
    alias="${rest%%)*})"
    rest="${rest#*) }"
    header="$name $alias"
  else
    header="$name"
  fi
  if [ -n "$rest" ]; then
    printf '%s\n    %s\0' "$header" "$rest"
  else
    printf '%s\0' "$header"
  fi
done | fzf --read0 --prompt="tmux> " --height=100% --layout=reverse --no-preview > "$PALETTE_OUTFILE"
