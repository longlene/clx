# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=Vista-Inspirate_1.0
DESCRIPTION="Vista inspired icon set for KDE"
HOMEPAGE="http://www.kde-look.org/content/show.php?content=31585"
SRC_URI="http://nuovext.pwsp.net/vista-inspirate/files/${MY_P}-kde.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-arch/gzip app-arch/tar"
RDEPEND=""

src_unpack() {
	unpack ${MY_P}-kde.tar.gz
}

src_install() {
	dodir /usr/share/icons/${PN}
	cp -r ${WORKDIR}/${MY_P}/* ${D}/usr/share/icons/${PN}
}
