#!/usr/bin/env bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"

: "${PALETTE_OUTFILE:?PALETTE_OUTFILE must be set}"

NL_INDENT=$'\n    '
FORMAT=$'#{command_list_name}#{?command_list_alias, (#{command_list_alias}),}\t#{command_list_usage}'

tmux list-commands -F "$FORMAT" |
  while IFS=$'\t' read -r header rest; do
    printf '%s%s\0' "$header" "${rest:+$NL_INDENT$rest}"
  done |
  fzf --read0 --prompt="tmux> " --height=100% --layout=reverse --no-preview > "$PALETTE_OUTFILE"
