# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Like grep, but for Apache logs"
HOMEPAGE="http://apachegrep.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_install() {
	dobin ${PN} || die "dobin failed"
	doman ${PN}.1
	dodoc CHANGELOG README TODO
}
