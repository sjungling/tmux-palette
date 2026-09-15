# tmux-palette

Fuzzy-search tmux's built-in commands and pre-fill tmux's command-prompt with
the one you pick. Only dependency: [fzf](https://github.com/junegunn/fzf).

## Requirements

- tmux (tested on 3.7c)
- [fzf](https://github.com/junegunn/fzf#installation)

## Install

### TPM

Add to `~/.tmux.conf`:

```tmux
set -g @plugin 'sjungling/tmux-palette'
```

Then `prefix + I` to install.

### Manual

```bash
git clone https://github.com/sjungling/tmux-palette ~/.tmux/plugins/tmux-palette
```

Add to `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-palette/command-palette.tmux
```

Reload: `tmux source-file ~/.tmux.conf`.

## Usage

Press `prefix + C-p`, type to fuzzy-filter, hit Enter. tmux's command-prompt
opens pre-filled with the picked command, ready for you to add flags/args.
Override the trigger key with `set -g @command-palette-key '...'`.
