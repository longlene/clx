# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils flag-o-matic cmake-utils

MY_PN="MyGUI"
MY_P="${MY_PN}_${PV}"

DESCRIPTION="A library for creating GUIs for games"
HOMEPAGE="http://mygui.info/"
SRC_URI="mirror://sourceforge/my-gui/${MY_PN}/${MY_P}/${MY_P}.zip"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +freetype media +plugins samples +tools wrapper"

RDEPEND="dev-games/ogre
	dev-games/ois
	freetype? ( media-libs/freetype:2 )"
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${P}-underlinking.patch
	epatch "${FILESDIR}"/${P}-build.patch
}

src_configure() {
	# QA
	append-flags -fno-strict-aliasing

	local mycmakeargs=(
		$(cmake-utils_use doc MYGUI_INSTALL_DOCS)
		$(cmake-utils_use freetype MYGUI_USE_FREETYPE)
		$(cmake-utils_use media MYGUI_INSTALL_MEDIA)
		$(cmake-utils_use plugins MYGUI_BUILD_PLUGINS)
		$(cmake-utils_use samples MYGUI_INSTALL_SAMPLES)
		$(cmake-utils_use tools MYGUI_BUILD_TOOLS)
		$(cmake-utils_use wrapper MYGUI_BUILD_WRAPPER)
		-DMYGUI_RENDERSYSTEM=2
	)

	cmake-utils_src_configure
}
