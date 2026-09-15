# tmux-palette

Fuzzy-search tmux's built-in commands and pre-fill tmux's own command-prompt
with the one you pick — no themes, no config files, no runtime beyond
[fzf](https://github.com/junegunn/fzf).

Press `prefix + P`, type part of a command name (e.g. `split`), hit Enter.
tmux's command-prompt opens with `split-window ` already typed in, cursor
ready for you to add flags or args before running it yourself.

## Requirements

- tmux (any reasonably recent version — built and tested on 3.7c)
- [fzf](https://github.com/junegunn/fzf#installation)

## Install

### TPM (Tmux Plugin Manager)

Add to `~/.tmux.conf`:

```tmux
set -g @plugin 'your-username/tmux-palette'
```

Then `prefix + I` to install.

### Manual

```bash
git clone https://github.com/your-username/tmux-palette ~/.tmux/plugins/tmux-palette
```

Add to `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-palette/command-palette.tmux
```

Reload: `tmux source-file ~/.tmux.conf`.

## Usage

- `prefix + P` opens the palette.
- Type to fuzzy-filter. Matching works against the full command usage line,
  so it also matches on aliases (e.g. typing `attach` finds
  `attach-session (attach) ...`) and flags.
- `Enter` closes the palette and opens tmux's command-prompt pre-filled with
  the chosen command name and a trailing space — add your own flags/args and
  press Enter to run it.
- `Esc` or `Ctrl-C` cancels with no side effects.

## Configuration

Only one option — the trigger key, bound under the `prefix` table (default
`P`):

```tmux
set -g @command-palette-key 'M-p'
```

## Known limitations

- If `fzf` isn't installed, `prefix + <key>` shows a warning message instead
  of opening the palette.
- The palette only pre-fills the command-prompt; it never runs a command for
  you.
