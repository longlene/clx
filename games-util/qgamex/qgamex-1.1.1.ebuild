# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games qt4-r2

DESCRIPTION="Launch your games in a separate X11 session with many options"
HOMEPAGE="http://www.dolezel.info/projects/qgamex"
SRC_URI="http://www.dolezel.info/sub/projekty/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="$(qt4_min_version 4.3)"
RDEPEND="${RDEPEND}"

src_compile() {
	qmake || die "qmake failed!"
	emake || die "make failed!"
}

src_install() {
	dodoc ChangeLog
	dobin qgamex || die "dobin failed"
}
