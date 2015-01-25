ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

# Better time format: http://superuser.com/questions/71857/change-the-output-format-of-zshs-time
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

plugins=(git npm go)

source $ZSH/oh-my-zsh.sh
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cookiecurl="curl -b cookies.txt -c cookies.txt $*"
alias rgrep="echo grep -r $2 ."
alias gg="git grep -n"

export PATH="/usr/local/bin:/usr/local/go/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/go_appengine:$HOME/go/bin"

export GOPATH="$HOME/go"
launchctl setenv GOPATH `go env GOPATH`
launchctl setenv GOROOT `go env GOROOT`

export EDITOR="nvim"
export LANG=en_US.UTF-8

zstyle ':completion:*' special-dirs true

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables bash completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"
