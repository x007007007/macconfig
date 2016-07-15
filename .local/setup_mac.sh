#!/bin/bash

if [ -x "/usr/bin/emacsclient" ] ; then
    vstr=`/usr/bin/emacsclient --version`
    
    v=${vstr##* }
    if [[ ${v%%.*} -le 24 ]] ; then
        echo "emace version too old $vstr ,delete" 
        sudo rm -i /usr/bin/emacsclient
    fi
fi

if [ -x "/usr/bin/emaces" ] ; then
    vstr=`/usr/bin/emaces --version|head -n1`
    v=${vstr##* }
    if [[ ${v%%.*} -le 24 ]] ; then
        echo "emace version too old $vstr ,delete" 
        sudo rm -i /usr/bin/emacs
        sudo rm -i -rf /usr/share/emacs
    fi
fi

