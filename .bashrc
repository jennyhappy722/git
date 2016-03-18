# .bashrc
#
# This file should contain aliases, shell variables, and functios,
# those cannot be passed to child process.
#
# Ref to .profile for details
#

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

###################################
## Standard Aliases
###################################
alias mv='mv -i'
alias cp='cp -i'
alias diff='diff -y'
alias ls='ls -FNp --color=auto --time-style=long-iso'
alias less='less -FRSXi'
alias rm=_rm
alias rrm='/bin/rm -i'
alias jenny='ssh u10316052@linux1.cs.utaipei.edu.tw'

###################################
## Local functions and commands
###################################
function _rm() {
local path
for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
        local dst=${path##*/}
        # append the time if necessary
        while [ -e ~/.Trash/"$dst" ]; do
            dst="$dst "$(date +%H-%M-%S)
        done
        mv "$path" ~/.Trash/"$dst"
    fi
    echo "$path deleted." # added by myself
done
}

###################################
## Shell style
###################################
#export PS1="\u@Mac [\w] "

# shorten the full path 
export MYPS='$(echo -n "${PWD/#$HOME/~}" | awk -F "/" '"'"'{if (length($0) > 14) { if (NF>4) print $1 "/" $2 "/.../" $(NF-1) "/" $NF; else if (NF>3) print $1 "/" $2 "/.../" $NF; else print $1 "/.../" $NF; } else print $0;}'"'"')'
#PS1='$(eval "echo ${MYPS}")$ '

if [ "$PS1" ]; then
    case $TERM in
        xterm*)
        if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
        else
            #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@MacBook:${PWD/#$HOME/~}"; echo -ne "\007"'
        fi
        ;;
        screen)
        if [ -e /etc/sysconfig/bash-prompt-screen ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
        else
            #PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\033\\"'
            PROMPT_COMMAND='echo -ne "\033_${USER}@MacBook:${PWD/#$HOME/~}"; echo -ne "\033\\"'
        fi
        ;;
        *)
        [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
        ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize

    Black='\e[0;30m'        # Nero
    Red='\e[0;31m'          # Rosso
    Green='\e[0;32m'        # Verde
    Yellow='\e[0;33m'       # Giallo
    Blue='\e[0;34m'         # Blu
    Purple='\e[0;35m'       # Viola
    Cyan='\e[0;36m'         # Ciano
    White='\e[0;37m'        # Bianco


    BBlack='\e[1;30m'       # Nero
    BRed='\e[1;31m'         # Rosso
    BGreen='\e[1;32m'       # Verde
    BYellow='\e[1;33m'      # Giallo
    BBlue='\e[1;34m'        # Blu
    BPurple='\e[1;35m'      # Viola
    BCyan='\e[1;36m'        # Ciano
    BWhite='\e[1;37m'       # Bianco

    UBlack='\e[4;30m'       # Nero
    URed='\e[4;31m'         # Rosso
    UGreen='\e[4;32m'       # Verde
    UYellow='\e[4;33m'      # Giallo
    UBlue='\e[4;34m'        # Blu
    UPurple='\e[4;35m'      # Viola
    UCyan='\e[4;36m'        # Ciano
    UWhite='\e[4;37m'       # Bianco


    On_Black='\e[40m'       # Nero
    On_Red='\e[41m'         # Rosso
    On_Green='\e[42m'       # Verde
    On_Yellow='\e[43m'      # Giallo
    On_Blue='\e[44m'        # Blu
    On_Purple='\e[45m'      # Purple
    On_Cyan='\e[46m'        # Ciano
    On_White='\e[47m'       # Bianco

    IBlack='\e[0;90m'       # Nero
    IRed='\e[0;91m'         # Rosso
    IGreen='\e[0;92m'       # Verde
    IYellow='\e[0;93m'      # Giallo
    IBlue='\e[0;94m'        # Blu
    IPurple='\e[0;95m'      # Viola
    ICyan='\e[0;96m'        # Ciano
    IWhite='\e[0;97m'       # Bianco



    BIBlack='\e[1;90m'      # Nero
    BIRed='\e[1;91m'        # Rosso
    BIGreen='\e[1;92m'      # Verde
    BIYellow='\e[1;93m'     # Giallo
    BIBlue='\e[1;94m'       # Blu
    BIPurple='\e[1;95m'     # Viola
    BICyan='\e[1;96m'       # Ciano
    BIWhite='\e[1;97m'      # Bianco



    On_IBlack='\e[0;100m'   # Nero
    On_IRed='\e[0;101m'     # Rosso
    On_IGreen='\e[0;102m'   # Verde
    On_IYellow='\e[0;103m'  # Giallo
    On_IBlue='\e[0;104m'    # Blu
    On_IPurple='\e[10;95m'  # Viola
    On_ICyan='\e[0;106m'    # Ciano
    On_IWhite='\e[0;107m'   # Bianco





    #[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "

    PS1="\`if [ \$? = 0 ]; then echo \[\e[35m\]^w^\[\e[0m\]; else echo \[\e[31m\]QAQ\[\e[0m\]; fi\`\u\e[38;05;199[$IYellow\]@jennyXD\e[$IBlue\][${MYPS}\]]\[$IGreen\] "
    #PS1="\u\e[38;05;199m@\e[0mMBP [\w] "
fi
