# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="scte65scan is a QAM frequency scanner for DVB devices"
HOMEPAGE="http://scte65scan.sourceforge.net/"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

SRC_URI="http://downloads.sourceforge.net/project/${PN}/${PN}/${PV}/${P}.tgz"
RESTRICT="nomirror"

IUSE=""
RDEPEND=""
DEPEND=""

src_install() {
	cd "${S}"
	exeinto /usr/bin
	doexe scte65scan
}
