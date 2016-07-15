#!/bin/sh

if [  -a ~/.emacs.d/init.el ] ; then
	echo "emacs configured"
else
	echo 'download https://github.com/x007007007/emacs.d.git'
	if [ -d ~/.emacs.d ]; then rm -r ~/.emacs.d ; fi
	git clone https://github.com/x007007007/emacs.d.git ~/.emacs.d
fi
