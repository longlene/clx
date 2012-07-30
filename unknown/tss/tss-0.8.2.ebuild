# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Terminal ScreenSaver"
HOMEPAGE="http://www.pulia.nu/tss/"
SRC_URI="http://www.pulia.nu/tss/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i 's/CFLAGS =/CFLAGS +=/' Makefile || die "sed failed"
}

src_install() {
	dobin ${PN} || die "dobin failed"

	insinto /etc/${PN}
	doins tss_art/* || die "doins failed"

	dodoc ART_CREDITS Changelog README
}
