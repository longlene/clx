#!/sbin/runscript

depend() {
	use logger dns
	need net
}


start() {
	ebegin "Starting dns2tcpd"
	start-stop-daemon --start --exec /usr/bin/dns2tcpd -- -f /etc/dns2tcpdrc
	eend $?
}

stop() {
	ebegin "Stopping dns2tcpd"
	start-stop-daemon --stop --pidfile /var/run/dns2tcp.pid
	eend $?
}
