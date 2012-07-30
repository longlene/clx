#!/sbin/runscript

depend() {
	need net
}

start() {
	ebegin "Starting ircu-ircd"
	start-stop-daemon --start --quiet --chuid ${IRCU_UID} --exec /usr/bin/ircu-ircd
	eend $? "Failed to start ircu-ircd"
}

stop() {
	ebegin "Stopping ircu-ircd"
	start-stop-daemon --stop --quiet --exec /usr/bin/ircu-ircd
	eend $? "Failed to stop ircu-ircd"
}
