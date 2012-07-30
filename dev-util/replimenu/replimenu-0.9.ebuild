# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="small menu-system mainly intended for use in shell scripts"
HOMEPAGE="http://replimenu.sourceforge.net/"
SRC_URI="mirror://sourceforge/replimenu/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples"

DEPEND=""

src_compile() {
	emake || die "emake failed"
}

src_install () {
	doman man/replimenu.1
	dobin src/replimenu || die "dobin replimenu failed"
	dodoc CHANGELOG README
	if use examples; then
		dodoc example.menu
	fi
}
