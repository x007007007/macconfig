#!/bin/bash
export WORKON_HOME=~/.virtualenvs/

foo_get_dir_file_strlist(){
    res=""
    if [[ -d "$1" ]] ;then
        for name in $1/* ;do
            name=`basename $name`
            res="$res ${name// /\\\\\\ }";
        done
    fi
    echo $res
    return 0
}

foo_change_python_env(){
    source=${HOME}/.virtualenvs/$1/bin/activate
    complete -W "$(foo_get_dir_file_strlist ${HOME}/.virtualenv/)" foo_change_python_env
    if [[ -f "$source" ]] ;then
        source $source
    else
        echo "don't have $1 virtualenv"
    fi
    return 0
}

