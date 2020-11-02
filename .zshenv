# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HISTFILE=~/.zsh_history
export HISTSIZE=30000
export SAVEHIST=30000
export HISTCONTROL=ignoredups:erasedups
export EDITOR='vim'
export PAGER='less'
export VISUAL='less'
export GREP_OPTIONS='--color=auto'
export LESS='-F -g -i -M -R -S -w -X -z-4'
export FZF_DEFAULT_OPTS='--reverse --exact -i'
export GOPATH=$HOME/go
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$GOPATH/bin:$HOME/bin:$PATH
export ENHANCD_FILTER="$HOME/.fzf/bin/fzf"
export ENHANCD_COMMAND='e'
