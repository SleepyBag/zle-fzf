# zle-fzf
Insert commands, file names and variable names fuzzily through fzf.

You can insert commands,

[![asciicast](https://asciinema.org/a/FHsUuTAwZADgHpIVo7aoYzvzM.svg)](https://asciinema.org/a/FHsUuTAwZADgHpIVo7aoYzvzM)

file names,

[![asciicast](https://asciinema.org/a/doc8WXcOLeKIiyXdMg5Xcdc9L.svg)](https://asciinema.org/a/doc8WXcOLeKIiyXdMg5Xcdc9L)

variable names,

[![asciicast](https://asciinema.org/a/DpGhu0oZXyoW50ymfzposZSvH.svg)](https://asciinema.org/a/DpGhu0oZXyoW50ymfzposZSvH)

and recent directories if you have `z` or `autojump` installed.

[![asciicast](https://asciinema.org/a/M8rtKmKUppQZ4cIQH6KYezVEW.svg)](https://asciinema.org/a/M8rtKmKUppQZ4cIQH6KYezVEW)

## Installation

- (Recommanded) Install with [zplug](https://github.com/zplug/zplug "zplug")

```
zplug "SleepyBag/zle-fzf"
```

- Or manually:

1. Clone this repo into an arbitrary path;
2. source file `zle-fzf.plugin.zsh` in your `.zshrc`.

Other zsh plugin managers should work like `zplug`. If `zle-fzf` doesn't work well with your plugin manager, please feel free to open a new issue.

## Dependencies

- zsh
- [fzf](https://github.com/junegunn/fzf "fzf")

### Optional

- [z](https://github.com/rupa/z "z") (to list recent files, you don't need autojump if you have z)
- [autojump](https://github.com/wting/autojump "autojump") (to list recent files, you don't need z if you have autojump)

# Usage

By default, the functions are binded as following:

| binding | function name | description |
|---------|---------------|-------------|
| M-x     | _fuzzy-insert-command | insert a command (binary, built-in, functions and etc) |
| M-f     | _fuzzy-insert-filename | find a file recursively and insert its name |
| M-d     | _fuzzy-insert-recent-dir | select a recent directory and insert its name |
| M-v     | _fuzzy-insert-variable | insert a variable name |

where `M-` means that you should keep pressing `Meta` key, which is typically `Alt`, when press the following key.

Surely you are able to rebind these functions to other keys by `bindkey`:

```
bindkey '^[x' _fuzzy-insert-command
bindkey '^[f' _fuzzy-insert-filename
bindkey '^[v' _fuzzy-insert-variable
bindkey '^[d' _fuzzy-insert-recent-dir
```
