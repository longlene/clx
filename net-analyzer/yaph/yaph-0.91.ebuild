# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Yet Another Proxy Hunter: Uses nmap to find proxies"
HOMEPAGE="http://yaph.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_unpack() {
unpack ${A}
cd "${S}"
epatch "${FILESDIR}/init.patch"
epatch "${FILESDIR}/tcp_utils.patch"
}

src_install() {
emake DESTDIR="${D}" install || die "Install failed"
}

pkg_postinst() {
elog "To make full use of YAPH: emerge net-analyser/nmap && emerge net-misc/proxychains "
}
