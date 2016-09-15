#!/bin/bash

if [ "$HOSTNAME" == "dauerbach" ]; then
    export PATH=$PATH:/Library/PostgreSQL/9.4/bin
    export PATH=$PATH:$HOME/Qt-5.6.0/bin:$HOME/miniconda3/bin
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
    export JAVA_JRE=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk
    export JRE_HOME=$(/usr/libexec/java_home)
    [ -r /Library/PostgreSQL/9.4/pg_env.sh ] && source /Library/PostgreSQL/9.4/pg_env.sh
fi

idavms="idadcc idahub idadb ida-staging idaprog"

[ -r /Users/dauerbach/.profile ] && source ~/.profile
source ~/.bash_aliases
if [[ "$idavms" =~ (^|[[:space:]])"$HOSTNAME"($|[[:space:]]) ]]; then
   source ~/.bash_idavms
fi
source ~/.bash_functions
[ -r /Users/dauerbach/.bashrc ] && source /Users/dauerbach/.bashrc

las () { la | sort --key=9 ;}
lls () { ll | sort --key=9 ;}
fj () { ps -A | grep "$@" ;}

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

bold=$(tput bold) # This could also be a color.
reset=$(tput sgr0)

export CLICOLOR=true
export PATH=/usr/local/bin:$PATH:/usr/local/sbin:/usr/local/packer
export GEOS_DIR=~/dev/lib

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \$(parse_git_branch) :\w \!> "

