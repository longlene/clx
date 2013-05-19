# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

SLOT="0"
LICENSE="as-is"
KEYWORDS="~amd64"
DESCRIPTION="Generic Object Oriented Database System"
SRC_URI="http://www.garret.ru/~knizhnik/${P}.tar.gz"
HOMEPAGE="http://www.garret.ru/~knizhnik/goods.html"
IUSE=""
S=${WORKDIR}/${PN}

src_compile() {
	./config || die "config failed"
	emake library || die "emake failed"
}

src_install () {
	cd bin && dobin browser cgibrows cgistub geturl goodsrv javamop monitor puturl && cd ..
	dohtml *.htm *.gif
}
