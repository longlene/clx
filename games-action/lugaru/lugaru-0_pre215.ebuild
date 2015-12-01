# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games cmake-utils mercurial

DESCRIPTION="A cross platform 3d action adventure"
HOMEPAGE="http://www.wolfire.com/lugaru"
SRC_URI=""
EHG_REPO_URI="http://hg.icculus.org/icculus/${PN}"
EHG_REVISION="b8e76dfc46ac"

LICENSE="GPL-2 free-noncomm"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-libs/jpeg
	media-libs/libogg
	media-libs/libpng
	media-libs/libsdl
	media-libs/libvorbis
	media-libs/openal
	virtual/opengl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

src_configure() {
	local mycmakeargs=(-DCMAKE_INSTALL_PREFIX="${GAMES_PREFIX_OPT}"/${PN})
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	games_make_wrapper ${PN} ./${PN} "${GAMES_PREFIX_OPT}/${PN}" "${GAMES_PREFIX_OPT}/${PN}"
	make_desktop_entry ${PN} "Lugaru: The Rabbit's Foot"
}
