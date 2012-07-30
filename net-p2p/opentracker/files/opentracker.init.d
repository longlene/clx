#!/sbin/runscript
# Copyright 2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

BINFILE="/usr/bin/opentracker"
PIDFILE="/var/run/opentracker.pid"
CONFFILE="/etc/opentracker.conf"

depend() {
	use net
}

start() {
    ebegin "Starting Opentracker daemon"
    start-stop-daemon \
	--background \
	--start --make-pidfile --pidfile "$PIDFILE" \
	--exec "$BINFILE" -- \
	"$EXEC_PARAMS"
    eend $?
}

stop() {
    ebegin "Stopping Opentracker daemon"
    start-stop-daemon \
	--stop --pidfile "$PIDFILE" \
	--exec "$BINFILE"
    eend $?
}

