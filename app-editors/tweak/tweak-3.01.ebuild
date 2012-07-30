# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic eutils

DESCRIPTION="Tweak is a hex editor that supports efficient insert and cutting of files."
HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/tweak/"
SRC_URI="http://www.chiark.greenend.org.uk/~sgtatham/tweak/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="x86"

DEPEND=">=sys-libs/ncurses-5"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS} -c" || die
}

src_install() {
	dobin tweak
	doman tweak.1
	dodoc LICENCE
}
