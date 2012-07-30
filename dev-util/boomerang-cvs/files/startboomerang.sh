#!/bin/bash
workdir=`pwd`
cd /usr/local/boomerang
if [ "$*" = "" ]; then
	./boomerang
else
	./boomerang -o ${workdir}/output $*
fi
