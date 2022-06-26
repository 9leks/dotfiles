export ZSH=$HOME/.oh-my-zsh

export EDITOR=nvim
export DOTS=$HOME/.config

plugins=(git tmux zsh-syntax-highlighting)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_DEFAULT_SESSION_NAME='default'

alias vim=nvim
setopt HIST_IGNORE_DUPS

source $HOME/.fzf.zsh
source $HOME/.cargo/env
source $ZSH/oh-my-zsh.sh
source $DOTS/zsh/colorscheme.zsh

THEME=$(cat /tmp/theme)
colorscheme $THEME

eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"

fpath+=$(brew --prefix)/share/zsh/site-functions
