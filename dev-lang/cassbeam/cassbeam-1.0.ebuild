# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

RESTRICT=""
DESCRIPTION="cassbeam is a Cassegrain antenna simulator."
HOMEPAGE="http://www.aoc.nrao.edu/~wbrisken/src/"
SRC_URI="http://www.aoc.nrao.edu/~wbrisken/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="virtual/x11
	virtual/tetex
	>=dev-libs/glib-1.2
	sci-libs/fftw"

S="${WORKDIR}/cassbeam"

src_install() {
	dobin cassbeam || die
	dodoc INSTALL LICENSE README || die
	insinto /usr/share/doc/${PN}-${PV}/doc
	doins doc/*.ps || die
	insinto /usr/share/doc/${PN}-${PV}/examples/vla
	doins examples/vla/* || die
}
