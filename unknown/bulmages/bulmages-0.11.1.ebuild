# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils eutils

DESCRIPTION="Suite empresarial basada en Qt4 que cuenta con Facturación y Contabilidad."
HOMEPAGE="http://developer.berlios.de/projects/bulmages/"
SRC_URI="http://download.berlios.de/bulmages/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-util/cmake-2.4.8
	>=x11-libs/qt-4.3.3
	>=dev-lang/python-2.4
	>=dev-python/PyQt4-4.3
	>=dev-db/libpq-8.1"
RDEPEND="${DEPEND}"

src_compile() {
	cmake-utils_src_configureout -D CMAKE_INSTALL_PREFIX:PATH=/usr
	cmake-utils_src_make -j1
}

src_install() {
	cmake-utils_src_install
}

pkg_postinst() {
	elog "Se necesita como mínimo postgresql 8.1 para poder ejecutar la"
	elog "aplicación. Por favorm para instalar postgresql siga el manual"
	elog "http://www.gentoo.org/doc/es/postgres-howto.xml"
}
