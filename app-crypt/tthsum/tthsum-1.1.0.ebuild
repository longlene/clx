# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="Generates and checks TTH checksums"
HOMEPAGE="http://freshmeat.net/projects/tthsum/"
SRC_URI="http://wza.digitalbrains.com/source/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}" \
		LDFLAGS="${LDFLAGS}" \
		BINS="bin" \
		|| die "emake failed"
}

src_install() {
	dobin bin/tthsum || die "dobin failed"
	doman tthsum.1
	dodoc Changelog.txt
}

