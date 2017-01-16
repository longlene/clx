# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

MY_PN=Box2D

inherit cmake-utils eutils

DESCRIPTION="Box2D is an open source physics engine written primarily for games."
HOMEPAGE="http://www.box2d.org"
SRC_URI="https://github.com/erincatto/Box2D/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc example static-libs"

RDEPEND="
	example? (
		virtual/opengl 
		media-libs/freeglut
		media-libs/glew
		media-libs/glfw
	)
"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${MY_PN}-${PV}
CMAKE_USE_DIR="${S}"/${MY_PN}

src_configure()
{
	local mycmakeargs=(
	-DBOX2D_INSTALL_DOC=$(usex doc)
	-DBOX2D_BUILD_SHARED=$(usex !static-libs)
	-DBOX2D_BUILD_STATIC=$(usex static-libs)
	-DBOX2D_BUILD_EXAMPLES=$(usex example)
	)

	cmake-utils_src_configure
}

