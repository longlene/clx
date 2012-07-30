# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${PN}${PV}rc3"

DESCRIPTION="Niceshaper is HTB configurator that gives you dynamic \
traffic management, which is more effective than traditional, static \
htb shaping."
HOMEPAGE="http://niceshaper.jedwabny.net/"
SRC_URI="http://niceshaper.jedwabny.net/files/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="net-firewall/iptables
	sys-apps/iproute2"

S=${WORKDIR}/${PN}

src_compile() {
	cd src
	g++ -Wall ns_class.cc ns_container.cc ns_filter.cc ns_instance.cc \
	ns_net.cc niceshaper.cc -o niceshaper
}

src_install() {
	insinto /usr/bin
	doins src/niceshaper
	fowners root:root /usr/bin/niceshaper
	fperms 770 /usr/bin/niceshaper
}
