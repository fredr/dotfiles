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
alias cmake-debug="cmake -DCMAKE_BUILD_TYPE=Debug"
rgrep() { grep -r -n "$1" . }
alias gt="go test -v"
alias ctags=/usr/local/bin/ctags
gtr() { go test -v -run=$1 }
alias kc=kubectl
dup() { docker-machine start default && eval "$(docker-machine env default)" }
dkill() { docker rm $(docker ps -a -q); docker rmi $(docker images -q) }

# The next line updates PATH for the Google Cloud SDK.
source '/Users/fredrik/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/fredrik/google-cloud-sdk/completion.zsh.inc'

export PATH="/usr/local/bin:/usr/local/go/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/go_appengine:$HOME/go/bin:$PATH"

export GOPATH="$HOME/go"
launchctl setenv GOPATH `go env GOPATH`
launchctl setenv GOROOT `go env GOROOT`

export EDITOR="nvim"
export LANG=en_US.UTF-8

zstyle ':completion:*' special-dirs true

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval $(thefuck --alias)
eval "$(docker-machine env default)"

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

[ -s "/Users/fredrik/.dnx/dnvm/dnvm.sh" ] && . "/Users/fredrik/.dnx/dnvm/dnvm.sh" # Load dnvm

source /usr/local/lib/dnx/bin/dnvm.sh
