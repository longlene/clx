# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="TCP over DNS tunnel"
HOMEPAGE="http://www.hsc.fr/ressources/outils/dns2tcp/"
SRC_URI="http://www.hsc.fr/ressources/outils/dns2tcp/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_install() {
	emake install DESTDIR="${D}" || die "make install failed"
	dodoc README

	insinto /etc
	doins server/dns2tcpdrc
	doins client/dns2tcprc
}

