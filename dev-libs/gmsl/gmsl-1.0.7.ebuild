# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="GNU Make Standard Library"
HOMEPAGE="http://gmsl.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /usr/include
	doins gmsl __gmsl

	dodoc README
	insinto /usr/share/doc/${PF}/html
	dohtml index.html
}
src_test() {
	make -f gmsl-tests || die "gmsl-tests failed"
}
