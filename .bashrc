# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#startup{{{
#}}}
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
# /usr/lib/jvm/java-7-oracle/lib/
export CLASSPATH=$JAVA_HOME/lib:~/programs/hadoop-2.4.1/jars
#export classpath=$JAVA_HOME/lib:~/programs/hadoop-2.4.1/jars
export EDITOR=vim
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

import_aws_keys(){
    AWS_ACCESS_KEY_ID=`head -n 1 ~/.awssecret`
    AWS_SECRET_ACCESS_KEY=`head -n 2 ~/.awssecret | tail -n 1`
}

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=irgnoredups:erasedups
HISTTIMEFORMAT="%F-%M-%S --> "
HISTIGNORE="cd *":"ls *":"mkdir *"

#Clang
LibClang_LIBRARY=/usr/lib/llvm-3.5/lib/libclang-3.5.so
LibClang_INCLUDE_DIR=/usr/lib/llvm-3.5/include/clang
#Ruby RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias rubyEnvironment='source ~/.rvm/scripts/rvm'
#Maven
export M2_HOME=/usr/share/maven
export M2=$M2_HOME/bin
export PATH=$M2:$PATH
# JAVA
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
#s3cmd

export PATH=$PATH:~/programs/s3cmd


alias rubyEnvironment='source ~/.rvm/scripts/rvm'

#HADOOP VARIABLES START
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export HADOOP_INSTALL=$HOME/programs/hadoop-2.4.1
export HADOOP_HOME=$HADOOP_INSTALL
export PATH=$PATH:$HADOOP_INSTALL/bin:$HADOOP_INSTALL/sbin
export HADOOP_MAPRED_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_HOME=$HADOOP_INSTALL
export HADOOP_HDFS_HOME=$HADOOP_INSTALL
export YARN_HOME=$HADOOP_INSTALL
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"
#HADOOP VARIABLES END
#AWS
export PATH=$PATH:~/programs/aws/


#set -o vi
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
AWS_KEY=AKIAI42IN2R26L3LQAWA
AWS_SECRET_KEY=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
CC_FILE="s3n://aws-publicdatasets/common-crawl/crawl-002/2009/09/17/7/1253241399873_7.arc.gz"

export PATH=$PATH:~/.npmprefix/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -e '/home/john/google-cloud-sdk/path.bash.inc' ]; then
    source '/home/john/google-cloud-sdk/path.bash.inc'
fi

# The next line enables bash completion for gcloud.
if [ -e  '/home/john/google-cloud-sdk/completion.bash.inc' ]; then
    source '/home/john/google-cloud-sdk/completion.bash.inc'
fi
extract () { 
    if [ -f $1 ] ; then 
        case $1 in 
            *.tar.bz2) tar xvjf $1 ;; 
            *.tar.gz) tar xvzf $1 ;; 
            *.bz2) bunzip2 $1 ;; 
            *.rar) rar x $1 ;; 
            *.gz) gunzip $1 ;; 
            *.tar) tar xvf $1 ;; 
            *.tbz2) tar xvjf $1 ;; 
            *.tgz) tar xvzf $1 ;; 
            *.zip) unzip $1 ;; 
            *.Z) uncompress $1 ;; 
            *.7z) 7z x $1 ;; 
            *) echo "don't know how to extract '$1'..." ;; 
        esac 
    else 
        echo "'$1' is not a valid file!" 
    fi 
} 
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
alias vimbash="vim ~/.bashrc"
alias sourcebash="source ~/.bashrc"
alias open="xdg-open"

export PATH=$PATH:/home/ec2-user/s3cmd
# HADOOP
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export HADOOP_INSTALL=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib"
export CLASSPATH="$CLASSPATH:/usr/local/hadoop/lib"
export HADOOP_COMMON_LIB_NATIVE_DIR="/usr/local/hadoop/lib"
export CC_FILE="s3n://aws-publicdatasets/common-crawl/crawl-002/2009/09/17/7/1253241399873_7.arc.gz"
if [[ -e ~/jie/local.sh ]]
then
    source ~/jie/local.sh
fi
export PATH="$HOME/programs/smartgit/bin/:$PATH" 
[ "$DISPLAY" ] && xset b 100

export NVM_DIR="/home/john/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 0.11.13

export PATH="~/.rvm/gems/ruby-2.1.2/bin:~/.rvm/bin:$PATH" # Add RVM to PATH for scripting
#xinput set-prop 15 "Device Enabled" 1
rvm use 2.0.0
