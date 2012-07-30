# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=3

inherit qt4-r2

DESCRIPTION="Offline Wikipedia Viewer"
HOMEPAGE="http://evopedia.info/"
SRC_URI="http://evopedia.info/src/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=x11-libs/qt-gui-4.4:4
	>=app-arch/bzip2-1.0.6
"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake4 evopedia.pro PREFIX="${EPREFIX}"/usr
}

