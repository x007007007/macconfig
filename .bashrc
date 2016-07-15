#!/bin/bash

. $HOME/.bash/init.bash

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home

export GOPATH=/usr/local/go
export PATH=$PATH:$GOPATH/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
