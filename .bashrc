export IDA_ARCHIVE_RAW_DIR=/ida/archive/raw
export IDA_CAL_RAW_DIR=/ida/cal/raw
export IDA_CAL_ANALYSIS_DIR=/ida/cal/analysis
export IDA_CAL_SHAKETABLE_DIR=/ida/cal/shaketable_tests
export IDA_RESPONSES_CUR_DIR=/ida/dcc/db/sensors
export IDA_RESPONSES_NOM_DIR=/ida/dcc/response/NOMINAL_RESPONSES
export IDA_DATASCOPEDB_DIR=/ida/dcc/db

export EDITOR=vim
export IDA_MSGQ_HOSTNAME=idaprog.ucsd.edu

export GEOS_DIR=~/dev/lib

export PATH=$PATH:$GOPATH/bin

export GOPATH=$HOME/gowork
export PATH=~/anaconda3/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

eval "$(direnv hook bash)"


if [[ "$HOSTNAME" =~ ^dauerbach ]]; then
	export PYTHONPATH=~/dev/dcc/dcc-modules-py:$PYTHONPATH
fi

if [[ "$HOSTNAME" =~ ^ida ]]; then
    source /ida/local/bashrc
    export PATH=/ida/local/scripts:/ida/local/bin:$PATH
    export PYTHONPATH=~/dev/dcc/modules-py:$PYTHONPATH

    # pull in ida specific env startup files
    rcfiles=(/ida/local/bashrc)
    for rcfile in $rcfiles
    do
       if [ -f $rcfile ] ; then
          source $rcfile
       fi
    done

fi


if [ -f /etc/bashrc ] ; then
	source /etc/bashrc
fi

export PS1="\u@\h \$(parse_git_branch) :\W \!> "
