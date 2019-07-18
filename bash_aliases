#!/bin/bash

alias ll="ls -l"
alias la="ls -al"
alias l="ls -CF"

alias kc="kubectl"

alias gg="git grep -n --untracked -I"
rgrep() {
  grep -r -n "$1" .
}

alias work="jrnl @work"
alias todo="jrnl @todo"

alias gst="git status"

# become a mac
alias open="xdg-open"
alias pbcopy="xclip -sel c"
alias pbpaste="xclip -sel c -o"

alias e="emacs -nw"
