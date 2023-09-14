# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="This installs the 'Dive Into Python' book by Mark Pilgrim"
HOMEPAGE="http://www.diveintopython.org/"
SRC_URI="http://www.diveintopython.org/download/${P}.zip"
LICENSE="FDL-1.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="nomirror"
DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/doc/
	doins -r "${WORKDIR}/diveintopython-${PV}"/ || die "doins failed"
}
