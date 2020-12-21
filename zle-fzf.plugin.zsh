#!/bin/zsh

function _fuzzy-insert-command {
    local choice
    choice=$(type -m '*' | fzf --height=40% | awk '{print $1}')
    zle -U "$choice"
    zle reset-prompt
}

function _fuzzy-insert-filename {
    local choice
    choice=$(find | fzf --height=40%)
    zle -U "$choice"
    zle reset-prompt
}

function _fuzzy-insert-variable {
    local choice
    choice="$"$(typeset | fzf --height=40% | awk -F= '{print $1}')
    zle -U "$choice"
    zle reset-prompt
}

function _fuzzy-insert-recent-dir {
    local choice
    if which _z &> /dev/null; then
        # if you use z to jump between directories
        choice=$(_z -l 2>&1 \
                     | tac \
                     | grep "/.*" -o \
                     | fzf --height=40%)
    elif which autojump &> /dev/null; then
        # if you use autojump
        choice=$(autojump -s \
                     | sed -E '/^___/q;s/[0-9]*\.[0-9]*:[[:space:]]*//;' \
                     | head -n-1 \
                     | fzf --height=40%)
    fi
    zle -U "$choice"
    zle reset-prompt
}

zle -N _fuzzy-insert-command
zle -N _fuzzy-insert-filename
zle -N _fuzzy-insert-variable
zle -N _fuzzy-insert-recent-dir

bindkey '^[x' _fuzzy-insert-command
bindkey '^[f' _fuzzy-insert-filename
bindkey '^[v' _fuzzy-insert-variable
bindkey '^[d' _fuzzy-insert-recent-dir
