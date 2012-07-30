# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Quake PAK archiving utility"
HOMEPAGE="http://linux.xulin.de/c/"
SRC_URI="http://linux.xulin.de/c/${P}.tar.gz
	http://www.ibiblio.org/pub/Linux/games/quake/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""

src_install() {
	dobin ${PN} || die
	doman ${PN}.1 || die

	dodoc ChangeLog *.txt README THANKS
}
