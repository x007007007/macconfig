function try_run() {
    if [ -x "$1" ] ;then
	if [ -x "$1.bk" ] ;then
	    if [ -n "`diff "$1" "$1.bk" `" ] ;then
    		echo "update $1"
        	cp -f "$1" "$1.bk"
	    else
		echo "finished $1"
	    fi
	else
            echo "run $@"
            $@
            cp -f "$1" "$1.bk"
	fi
    else
        echo "don't exist $1"
    fi
}

try_run "$HOME/.vim/init.sh"
try_run "$HOME/.emacs.d/init.sh"
try_run "$HOME/.config/awesome/init.sh"
try_run "$HOME/.local/setup_common.sh"

case "`uname`" in
    Darwin )
        echo "run mac setup"
        try_run "$HOME/.local/setup_mac.sh"
    ;;
    Linux )
	echo "run linux setup"
	try_run "HOME/.local/setup_linux.sh"
    ;;
esac
