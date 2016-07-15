#!/bin/sh

mkdir -p ~/.local/bin

ls -1td ~/.local/setup.d/[0-9]*.sh  |xargs  command
