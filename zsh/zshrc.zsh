export ZSH=$HOME/.oh-my-zsh
export EDITOR=nvim
export DOTS=$HOME/.config

plugins=(git tmux zsh-syntax-highlighting)

if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    export ZSH_TMUX_AUTOSTART=true
    ZSH_TMUX_DEFAULT_SESSION_NAME='default'
fi

alias vim=nvim

alias gits="git status"
alias gita="git add -v"
alias gitc="git commit"
alias gitl="git log"

setopt HIST_IGNORE_DUPS

THEME=$(cat /tmp/theme)

eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
source $DOTS/zsh/colorscheme.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

colorscheme $THEME
