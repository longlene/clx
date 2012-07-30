# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE=""

MY_S=${WORKDIR}/${PN}

DESCRIPTION="Program for extracting embedded audio data from JPEG images (written in Python)."
HOMEPAGE="http://developer.berlios.de/projects/wavextract/"
SRC_URI="http://download.berlios.de/wavextract/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND="dev-python/imaging"

src_install() {
	dodoc ${MY_S}/COPYING ${MY_S}/README
	exeinto /usr/bin
	doexe ${MY_S}/wavextract
}
