#!/sbin/runscript
# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

depend() {
	use net
}

start() {
	ebegin "Starting GMediaServer"
	gmediaserver -b --pid-file=/var/run/gmediaserver.pid \
		${GMEDIASERVER_OPTS} ${GMEDIASERVER_DIRS}
	eend $?
}

stop() {
	ebegin "Stopping GMediaServer"
	start-stop-daemon --stop --pidfile /var/run/gmediaserver.pid
	eend $?
}
