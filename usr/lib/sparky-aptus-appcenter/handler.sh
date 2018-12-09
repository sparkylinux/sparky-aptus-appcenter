#!/bin/bash

# Created by Piotr "MoroS" Mrożek 2018
# Quick guide of YAD output codes:
# exit 0 - Yad supports URL (goes to a next page)
# exit 1 - Yad ignores URL (does nothing)
# exit 2 - Yad treats URL as a file downloading (not tested yet)
# Last update by pavroo Dec 9, 2018

URI="$1"

# ignore empty URI
if [[ "$URI" == "" ]]; then
	echo "no command... exiting..."
	exit 1
fi

# html URI runs external www-browser
if [[ "$URI" == http* ]]; then
	echo "running external web page..."
	x-www-browser "$URI" &
	exit 1
fi

# local file URI opens inside YAD
if [[ "$URI" == file* ]]; then
	echo "running a web page from local disk..."
	exit 0
fi

# aptus://something runs our command inside YAD
if [[ "$URI" == aptus* ]]; then
	# remove 'aptus:'
	echo "$URI"
	CMD=`echo "$URI" | sed -e 's/aptus:\/\///'`
	
	echo "running a command for $CMD..."

	CHECKDESKTOP=`echo "$CMD" | grep environment`
	CHECKAPP=`echo "$CMD" | grep app`
	CHECKTOOL=`echo "$CMD" | grep tool`

	# section: desktops
	if [ "$CHECKDESKTOP" != "" ]; then
		RUNDESKTOP=`echo "$CMD" | sed -e 's/environment_//'`
		./bin/aptus-desktop $RUNDESKTOP
	# section: apps
	elif [ "$CHECKAPP" != "" ]; then
		RUNAPP=`echo "$CMD" | sed -e 's/app_//'`
		./bin/aptus-app $RUNAPP
	# section: aptus tools
	elif [ "$CHECKTOOL" != "" ]; then
		RUNTOOL=`echo "$CMD" | sed -e 's/tool_//'`
		./bin/aptus-tool $RUNTOOL
	else
		echo "unknown command... exiting"
	fi
fi

exit 1
