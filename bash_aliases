#!/bin/bash

alias testssl="docker run -it drwetter/testssl.sh"

alias la="ls -al"

alias kc="kubectl"
function kceachctx() {
    for ctx in $(kubectl config get-contexts -o name)
    do
    {
        (
           local res=$(kubectl --context $ctx "$@")
           printf "Context \"%s\":\n%s\n\n" "$ctx" "$res"
        ) &
    } 2>/dev/null
    done
    wait 2>/dev/null
}

alias gg="git grep -n --untracked -I"
rgrep() {
  grep -r -n "$1" .
}

alias gst="git status"

# become a mac
alias open="xdg-open"
alias pbcopy="xclip -sel c"
alias pbpaste="xclip -sel c -o"

alias e="emacs -nw"

alias joke="curl -H \"Accept: text/plain\" https://icanhazdadjoke.com/ -w \"\n\""

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
