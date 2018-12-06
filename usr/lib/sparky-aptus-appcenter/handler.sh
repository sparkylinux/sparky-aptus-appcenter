#!/bin/bash

# created by Piotr "MoroS" Mrożek 2018
# szybki tutorial kodow wyjscia YAD:
# exit 0 - Yad obsluzy URL (np. przejdzie do nastepnej strony)
# exit 1 - Yad zignoruje URL (nie zrobi nic)
# exit 2 - Yad uzna to za URL do sciagniecia pliku (nie testowalem tego jeszcze)
# last update by pavroo Dec 6, 2018

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

	CHECKWEBEMAIL=`echo "$CMD" | grep email`
	CHECKWEBOTHER=`echo "$CMD" | grep webother`
	CHECKWEBBROWSER=`echo "$CMD" | grep webbrowser`

	# section: web email
	if [ "$CHECKWEBEMAIL" != "" ]; then
		RUNWEBEMAIL=`echo "$CMD" | sed -e 's/webEMAIL_//'`
		/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEBEMAIL

	elif [ "$CHECKWEBOTHER" != "" ]; then
		RUNWEBOTHER=`echo "$CMD" | sed -e 's/webother_//'`
		/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEBOTHER

	# section: web browser
	elif [ "$CHECKWEBBROWSER" != "" ]; then
		RUNWEBBROWSER=`echo "$CMD" | sed -e 's/webbrowser_//'`
		/usr/lib/sparky-aptus-appcenter/bin/aptus-internet $RUNWEBBROWSER
	else
		echo "unknown command... exiting"
	fi

	exit 1

fi

exit 1
