#!/bin/bash

alias idahome='sshfs dauerbach@idadcc.ucsd.edu:/home/dauerbach ~/idadcc-home'
alias idaproghome='sshfs dauerbach@idaprog.ucsd.edu:/home/dauerbach ~/idaprog-home'
alias la='ls -lha'
alias ll='ls -hl'
alias lt='ls -hlaT'
alias l.='ls -hlda .*'
alias du='du -cbsh'

alias grep="grep --color=auto"

alias nv='nvim'

alias h4='head -n 4'
alias t4='tail -n 4'
alias h10='head -n 10'
alias t10='tail -n 10'

alias sa='source activate'
alias wc='wc -l'
alias jn='jupyter notebook'

alias mntida='sudo mount -t nfs igppixs1.ucsd.edu:/mnt/vol1/ida /ida'
alias umntida='sudo umount /ida'
