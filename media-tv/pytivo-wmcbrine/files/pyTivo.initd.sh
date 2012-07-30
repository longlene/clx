#!/sbin/runscript
# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

depend() {
	need localmount net
	after bootmisc
}

start() {
	ebegin "Starting pyTivo"
	start-stop-daemon --start --exec /usr/bin/pytivo \
		--pidfile /var/run/pytivo.pid -m -N 19 -c pytivo:pytivo \
		-- > /dev/null 2>&1 &
	eend $?
}

stop() {
	ebegin "Stopping pyTivo"
	start-stop-daemon --stop --exec /usr/bin/pytivo \
		--pidfile /var/run/pytivo.pid
	eend $?
}

restart() {
	stop
	sleep 2
	start
}

