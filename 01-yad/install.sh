#!/bin/sh
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

if [ "$1" = "uninstall" ]; then
   	rm -f /usr/bin/sparky-aptus-appcenter
   	rm -rf /usr/lib/sparky-aptus-appcenter
   	rm -f /usr/share/applications/sparky-aptus-appcenter.desktop
   	rm -f /usr/share/icons/hicolor/24x24/apps/sparky-aptus-appcenter.png
   	rm -f /usr/share/icons/hicolor/48x48/apps/sparky-aptus-appcenter.png
   	rm -f /usr/share/icons/hicolor/scalable/apps/sparky-aptus-appcenter.svg
   	rm -f /usr/share/pixmaps/sparky-aptus-appcenter.png
   	rm -rf /usr/share/sparky/sparky-aptus-appcenter
else
	cp bin/* /usr/bin/
	cp lib/sparky-aptus-appcenter /usr/lib/
	cp share/applications/* /usr/share/applications/
	cp share/icons/hicolor/24x24/apps/sparky-aptus-appcenter.png /usr/share/icons/hicolor/24x24/apps/
	cp share/icons/hicolor/48x48/apps/sparky-aptus-appcenter.png /usr/share/icons/hicolor/48x48/apps/
	cp share/icons/hicolor/scalable/apps/sparky-aptus-appcenter.svg /usr/share/icons/hicolor/scalable/apps/
	cp share/pixmaps/* /usr/share/pixmaps/
	cp share/sparky/sparky-aptus-appcenter/* /usr/share/sparky/sparky-aptus-appcenter/
fi
