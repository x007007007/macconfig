function try_run() {
    if [ -x $1 ] ; then
        echo "run $@"
	$@
    else
	echo "don't exist $1"
    fi
}

try_run "$HOME/.vim/init.sh"
try_run "$HOME/.emacs.d/init.sh"
try_run "$HOME/.config/awesome/init.sh"

case "`uname`" in
    Darwin )
        echo "mac"
        try_run "$HOME/.local/setup_mac.sh"
    ;;
    Linux )
	echo "linux"
	try_run "HOME/.local/setup_linux.sh"
    ;;
esac
