# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4-r2

DESCRIPTION="The Programmers Solid 3D CAD Modeller"
HOMEPAGE="http://www.openscad.org/"
SRC_URI="http://openscad.org/download/${P}.src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sci-misc/opencsg
	sci-mathematics/cgal
	x11-libs/qt-core
	x11-libs/qt-gui
	x11-libs/qt-opengl
"
RDEPEND="${DEPEND}"

src_prepare() {
	#Use our CFLAGS (specifically don't force x86)
	sed -i "s/QMAKE_CXXFLAGS_RELEASE = .*//g" ${PN}.pro

	sed -i "s/\/usr\/local/\/usr/g" ${PN}.pro
}
