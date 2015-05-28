TERM=xterm-256color

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# Better time format: http://superuser.com/questions/71857/change-the-output-format-of-zshs-time
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

plugins=(git npm go)

source $ZSH/oh-my-zsh.sh
unsetopt share_history

alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cookiecurl="curl -b cookies.txt -c cookies.txt $*"
alias gg="git grep -n"
rgrep() { grep -r -n "$1" . }
alias gt="go test -v"
gtr() { go test -v -run=$1 }

export PATH="/usr/local/bin:/usr/local/go/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/go_appengine:$HOME/go/bin"

export GOPATH="$HOME/go"
launchctl setenv GOPATH `go env GOPATH`
launchctl setenv GOROOT `go env GOROOT`

export EDITOR="nvim"
export LANG=en_US.UTF-8

zstyle ':completion:*' special-dirs true

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/fredrik/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
