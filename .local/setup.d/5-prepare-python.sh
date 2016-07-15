#!/bin/sh

mkdir -p ~/.local/bin

## alias brew='echo brew '
## alias apt-get='echo apt-get '
## alias yum='echo yum '
## 
function install_by_manager () {
    case "`uname`" in
        Darwin)
             if [ -z `which brew` ] ;then
                echo "don't have brew"
                /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
             fi
             for pkg_name in $@ ;do
                brew install "${pkg_name}"
             done
        ;;
        Linux)
            if [ -n `which apt-get` ] ;then
                echo 'find apt-get'
                sudo apt-get install $@
            fi
        ;;
    esac
}

function run_or_install_run () {
    cmd="$1"
    local OPTIND=2 OPTARG OPTION;
    while getopts 'n::'  option  ;do
        case "$option" in 
            n )
                filename $OPTARG 
            ;;
            * )
                echo $o
            ;;
        esac
    done
        
    if [ -z `which $cmd` ] ;then 
        echo ${cmd%% *} need install 
    fi
}

function install_python_env {
    if [ -z `which python`  ] ;then 
        echo 'install python'
        install_by_manager python
    fi
    if [ -z `which pip`  ] ;then
        echo 'install pip'
        wget https://bootstrap.pypa.io/get-pip.py -o ~/.local/get-pip.py
        python ~/.local/get-pip.py --user
    fi
}


install_python_env

if [  -a ~/.emacs.d/init.el ] ; then
	echo "emacs configured"
else
	echo 'download https://github.com/x007007007/emacs.d.git'
	if [ -d ~/.emacs.d ]; then rm -r ~/.emacs.d ; fi
	git clone https://github.com/x007007007/emacs.d.git ~/.emacs.d
fi
