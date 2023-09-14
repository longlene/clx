# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Honeytrap is a network security tool for observing network services via low-interactive honeypot"
HOMEPAGE="http://honeytrap.mwcollect.org"
SRC_URI="mirror://sourceforge/honeytrap/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE="pcap-mon ipq-mon efence debug"

DEPEND="virtual/libc
	pcap-mon? ( virtual/libpcap )
	ipq-mon? ( net-firewall/iptables )
	efence? ( dev-util/efence )"

pkg_setup() {
	enewgroup honeytrap
	enewuser honeytrap -1 -1 /sbin/nologin honeytrap
}

src_compile() {
	local myconf

	if ! use pcap-mon && ! use ipq-mon ; then
		eerror "You must choose one connection monitor."
		eerror "Currently only pcap-based and ip_queue-based monitors are supported."
		die
	fi

	if use ipq-mon ; then
		myconf="${myconf} --with-libipq-includes=/usr/include/libipq"
		epause 3
		einfo "You need to have IP_NF_QUEUE enabled in your kernel for this to work."
	fi

	if use efence; then
		epause 3
		ewarn "You have enabled a link with Electric Fence malloc debugger."
		ewarn "It is known that Honeytrap will not work with efence and xen-sources."
	fi

	econf \
		$(use_with pcap-mon) \
		$(use_with ipq-mon) \
		$(use_enable efence) \
		$(use_enable debug) \
		${myconf} || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	# Few hacks needed. Feel free to figure out a better way.
	# A. Correct fuzzy locations.
	mv "${S}"/etc/etc/* "${S}"/etc/	|| die

	emake DESTDIR="${D}" install || die "emake install failed"

	# B. Unfortunately the dynamic shared plugins are installed into /etc/honeytrap/plugins by default.
	# The easiest way is to just move them and put them into /usr/src/honeytrap_dynamicsrc (cf. Snort).
	mkdir "${D}"/usr/src
	mv "${D}"/etc/honeytrap/plugins "${D}"/usr/src/honeytrap_dynamicsrc || die

	# As the ebuild includes a modified version of this file, no need to copy this into the live system.
	rm "${D}"/etc/honeytrap/honeytrap.conf*

	# Note: man gets installed by default.
	insinto /etc || "insinto failed"
	mv "${D}"/etc/honeytrap/ports.conf.dist "${D}"/etc/honeytrap/ports.conf
        dodoc README NEWS TODO ChangeLog

	newinitd "${FILESDIR}"/${PN}.initd ${PN} || die "newinitd failed"
	newconfd "${FILESDIR}"/${PN}.confd ${PN} || die "newconfd failed"
	cp "${FILESDIR}"/honeytrap.conf "${D}"/etc/honeytrap/

	keepdir /var/log/honeytrap
	keepdir /var/log/honeytrap/attacks
	keepdir /var/log/honeytrap/downloads

	fowners -R honeytrap:honeytrap /var/log/honeytrap
	fperms 0700 -R /var/log/honeytrap
}

pkg_postinst() {
	ewarn ""
	ewarn "WARNING (from the README):"
	ewarn "Honeytrap is a low-interactive honeypot and therefore detectable."
	ewarn "It  is  written  in  C  and thus potentially vulnerable to buffer"
	ewarn "overflow attacks. Take care. Running in mirror mode is dangerous."
	ewarn "Attacks  may  be directed to the attacker, appearing to come from"
	ewarn "your system. Use with caution."
	ewarn ""
}
