# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Hex Editor with vi/ex-style user interface"
HOMEPAGE="http://devel.ringlet.net/editors/hexer/"
SRC_URI="http://devel.ringlet.net/editors/${PN}/${P}.tar.gz"

LICENSE="hexer"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	dobin ${PN} || die
	doman ${PN}.1 || die
	dodoc CHANGES README || die
}
