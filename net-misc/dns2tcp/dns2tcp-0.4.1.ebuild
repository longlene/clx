# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="TCP over DNS tunnel"
HOMEPAGE="http://www.hsc.fr/ressources/outils/dns2tcp/"
SRC_URI="http://www.hsc.fr/ressources/outils/dns2tcp/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${PN}-pid_file.diff
}

src_install() {
	emake install DESTDIR="${D}" PROGRAMS="${progs}" || die "make install failed"
	doman *.8
	newinitd "${FILESDIR}"/dns2tcp.init.d dns2tcp || die
	dodoc CHANGES README TODO SMALL MULTI
	dodir /etc/
	mv "${FILESDIR}"/dns2tcp.conf  /etc/dns2tcpdrc
}

