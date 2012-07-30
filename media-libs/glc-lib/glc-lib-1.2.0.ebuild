# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: glc-player-2.1.0.ebuild $

EAPI="2"

inherit qt4-r2

SRC_URI="mirror://sourceforge/${PN}/GLC_lib_src_${PV}.zip"

DESCRIPTION="OpenGL Library Class"
HOMEPAGE="http://www.glc-lib.net/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND="x11-libs/qt-opengl:4"

RDEPEND=${DEPEND}

S="${WORKDIR}"/GLC_lib_src_${PV}/glc_lib
