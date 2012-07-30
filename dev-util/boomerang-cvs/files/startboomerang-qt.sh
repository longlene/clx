#!/bin/bash
cd /usr/local/boomerang
if [ "$*" = "" ]; then
	./boomerang-qt
else
	./boomerang-qt $*
fi
