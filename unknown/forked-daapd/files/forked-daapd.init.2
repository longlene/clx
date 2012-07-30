#!/sbin/runscript
# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Based on mt-daapd init.d file created for gentoo 
#
# You can run multiple copies of this service just symlinking them to
# forked-daapd.<name>, then it will load /etc/forked-daapd.d/<name>.conf as config
# file.
# Remember to give them different logs and cache directories.
#
# The main instance (with no <name>) uses /etc/forked-daapd.conf

# Check for OpenRC/Baselayout 2 -- see bug #230917
if [ -f /lib/librc.so -o -f /etc/init.d/sysfs -o -f /lib/rc/version ]; then
	myservice=$RC_SVCNAME
fi

CONF="${myservice##*.}"
if [[ -n ${CONF} && ${myservice} != "forked-daapd" ]]; then
	PIDFILE="/var/run/forked-daapd.${CONF}.pid"
	CONFFILE="/etc/forked-daapd.d/${CONF}.conf"
else
	PIDFILE="/var/run/forked-daapd.pid"
	CONFFILE="/etc/forked-daapd.conf"
fi

depend() {
	need net
	#USEHOWL need mDNSResponderPosix
}

start() {
	ebegin "Starting forked-daapd DAAP server"
	start-stop-daemon --start --quiet --pidfile ${PIDFILE} \
		--exec /usr/sbin/forked-daapd -- -P ${PIDFILE} -c ${CONFFILE}
	eend $?
}

stop() {
	ebegin "Stopping forked-daapd DAAP server"
	start-stop-daemon --stop --quiet --pidfile ${PIDFILE} --signal 2
	eend $?

	rm -f ${PIDFILE}

}
