#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\[\e[36;1m\]\u@\[\e[32;1m\]\h \[\e[1;34m\]\w\[\e[m\]\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[1;32m\]\$\[\e[m\] '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# colored less for man pages
export LESS="-R -X -F"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

[ -r ~/.bash_aliases   ] && . ~/.bash_aliases

# fix git promt
# https://bbs.archlinux.org/viewtopic.php?id=147462
. /usr/share/git/git-prompt.sh

# virtualenv tools
source /usr/bin/virtualenvwrapper.sh

export PATH="$HOME/bin:$PATH:$HOME/go/bin"

export HISTSIZE=99999999
HISTIGNORE='cfn-delete-stack *'
HISTCONTROL='ignorespace'

# java-common package is somehow fucked up
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# aws autocompletion
complete -C '/usr/bin/aws_completer' aws

eval "$(rbenv init -)"

# ssh agent is sometimes broken, ugly workaround
eval $(gnome-keyring-daemon --start) && export SSH_AUTH_SOCK
source /usr/share/nvm/init-nvm.sh

export GOPATH=~/go
source /usr/bin/activate.sh

# awsenv https://github.com/Luzifer/awsenv
function set_aws {
  eval $(awsenv shell $1)
}

function login_aws {
  open $(awsenv console $1)
}

export EDITOR=/usr/bin/vim

source .bashrc_secrets
