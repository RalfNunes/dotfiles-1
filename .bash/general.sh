alias ll="ls -Glahs"
alias psgrep="ps aux | grep -v grep | grep"

export PATH="./bin:$INSTALL_DIR/bin:$INSTALL_DIR/ruby/gems/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PS1="\n[vagrant] \w\n$ "
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CDPATH=.:/vagrant:/Projects:$HOME:$HOME/Projects
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=1000000
export HISTCONTROL=erasedups
export GEM_HOME=$INSTALL_DIR/ruby/gems
export GEM_PATH=$INSTALL_DIR/ruby/gems
export CDHISTORY="/tmp/cd-$USER"

shopt -s cdspell
shopt -s nocaseglob
shopt -s checkwinsize
shopt -s dotglob
shopt -s extglob
shopt -s progcomp
shopt -s histappend
shopt -s globstar
shopt -s autocd
shopt -s dirspell

set -o ignoreeof
set bell-style none

unset MAILCHECK                           # Disable "you have mail" warning
ulimit -S -c 0                            # Disable core dump

if [ ! -f $CDHISTORY ]; then              # Only autocd when the $CDHISTORY file
  if [ -d /Projects ]; then               # cannot be found. In this case, try
    cd /Projects                          # to find the /Projects directory,
  elif [ -d /vagrant ]; then              # defaulting to the vagrant directory.
    cd /vagrant
  fi
fi

if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
fi
