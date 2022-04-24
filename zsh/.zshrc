# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> INIT <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< #

if [[ $(who | wc -l) -eq 2 ]] && ! [[ -n "$TMUX" ]] && ! [[ "$TERM_PROGRAM" = 'vscode' ]]; then
  neofetch
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# >>>>>>>>>>>>>>>>>>>>>>> COMMAND && DIRECTORY ALIASES <<<<<<<<<<<<<<<<<<<<<<< #

# command
alias ll='ls -hlG'
alias la='ls -ahlG'
alias rm='rm -i'
alias rm='rm -rfI'
alias vim='nvim'
alias nn='nvim'
alias n='nnn -e'
alias gs='git status'
alias gl='git log --all --graph --decorate'

# >>>>>>>>>>>>>>>>>>>> VARIABLES, BINDINGS, & SH. OPTIONS <<<<<<<<<<<<<<<<<<<< #
export EDITOR='nvim'

setopt histignorespace
setopt autocd

bindkey \^U backward-kill-line

autoload -U colors && colors

# >>>>>>>>>>>>>>> LANGUAGE SPECIFIC VERSION & PACKAGE MANAGERS <<<<<<<<<<<<<<< #

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# miniconda
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>> LOAD SHELL TOOLS <<<<<<<<<<<<<<<<<<<<<<<<<<<<< #

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-higlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
