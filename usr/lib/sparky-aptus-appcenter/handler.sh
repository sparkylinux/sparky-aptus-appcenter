#!/bin/bash

# Created by Piotr "MoroS" Mrożek 2018
# Quick guide of YAD output codes:
# exit 0 - Yad supports URL (goes to a next page)
# exit 1 - Yad ignores URL (does nothing)
# exit 2 - Yad treats URL as a file downloading (not tested yet)
# Last update by pavroo Dec 6, 2018

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

	#CHECKWEBEMAIL=`echo "$CMD" | grep webemail`
	#CHECKWEBP2P=`echo "$CMD" | grep webp2p`
	#CHECKWEBOTHER=`echo "$CMD" | grep webother`
	CHECKWEB=`echo "$CMD" | grep web`

	### section: internet ###

	# sub-section internet: web email
	#if [ "$CHECKWEBEMAIL" != "" ]; then
	#	RUNWEBEMAIL=`echo "$CMD" | sed -e 's/webemail_//'`
	#	/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEBEMAIL

	# sub-section internet: web p2p 
	#elif [ "$CHECKWEBP2P"= "" ]; then
	#	RUNWEBP2P=`echo "$CMD" | sed -e 's/webp2p_//'`
	#	/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEBP2P

	# sub-section internet: web other 
	#elif [ "$CHECKWEBOTHER" != "" ]; then
	#	RUNWEBOTHER=`echo "$CMD" | sed -e 's/webother_//'`
	#	/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEBOTHER

	# sub-section internet: web browser
	if [ "$CHECKWEB" != "" ]; then
		RUNWEB=`echo "$CMD" | sed -e 's/web_//'`
		/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEB
	else
		echo "unknown command... exiting"
	fi

	exit 1

fi

exit 1
