#!/bin/bash

alias testssl="docker run -it drwetter/testssl.sh"

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

function c() {
    kubectl config use-context $1
}
function _c() {
    local cur kubectl_out
    cur=${COMP_WORDS[COMP_CWORD]}
    if kubectl_out=$(kubectl config get-contexts -o name 2>/dev/null); then
        COMPREPLY=( $( compgen -W "${kubectl_out[*]}" -- "$cur" ) )
    fi
}
complete -F _c c
