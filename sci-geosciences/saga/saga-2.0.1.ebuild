# Copyright 2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit autotools

WANT_AUTOCONF="2.61"

PATCH=""
LANGS=""
NOSHORTLANGS=""

DESCRIPTION="SAGA System for Automated Geoscientific Analysis"
HOMEPAGE="http://www.saga-gis.org"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2 LGPL-2.1"
IUSE="unicode"
USE="-unicode"

SRC_URI="http://downloads.sourceforge.net/saga-gis/saga_${PV}_src_linux.tar.gz"
S=${WORKDIR}/saga-2.0

DEPEND=">=x11-libs/wxGTK-2.8.0
		sci-libs/proj
		sci-libs/gdal"
RDEPEND=${DEPEND}

src_unpack() {
	unpack saga_${PV}_src_linux.tar.gz
}

src_compile() {
	econf $(use_enable unicode) || die
	emake -j1 || die
}

src_install() {
	make DESTDIR=${D} install
}
