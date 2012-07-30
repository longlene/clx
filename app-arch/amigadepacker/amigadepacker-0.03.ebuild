# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


DESCRIPTION="Depacker for amiga archive formats"
SRC_URI="http://zakalwe.fi/~shd/foss/amigadepacker/amigadepacker-0.03.tar.bz2"
HOMEPAGE="http://zakalwe.fi/~shd/foss/amigadepacker/"

SLOT="0"
LICENSE="GPL-2"
IUSE=""
KEYWORDS="~amd64 ~x86"


src_compile() {
	econf --prefix=/usr --package-prefix=${D} || die
	emake || die
}

src_install() {
	einstall || die
	dodoc ChangeLog README
}

