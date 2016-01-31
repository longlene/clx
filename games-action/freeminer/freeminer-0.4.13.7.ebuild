# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games cmake-utils flag-o-matic

DESCRIPTION="Freeminer is an open source sandbox game inspired by Minecraft"
HOMEPAGE="http://freeminer.org/"
SRC_URI="mirror://github/freeminer/freeminer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="doc"

DEPEND="
	app-arch/bzip2
	app-arch/snappy
	dev-db/redis
	dev-db/sqlite
	dev-games/irrlicht
	dev-libs/gmp
	dev-libs/hiredis
	dev-libs/leveldb
	dev-libs/jsoncpp
	net-misc/curl
	media-libs/freetype
	media-libs/libpng
	media-libs/libvorbis
	media-libs/openal
	net-libs/enet
	sys-libs/zlib
	virtual/jpeg
	virtual/opengl
	x11-libs/libxcb
	x11-libs/libICE
	x11-libs/libX11
	x11-libs/libXxf86vm
	doc? ( app-doc/doxygen )
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's#jsoncpp_lib_static#jsoncpp#' cmake/Modules/FindJson.cmake
}

src_configure() {
	append-cxxflags -std=c++11 -I/usr/include/jsoncpp
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}"/usr
		-DRUN_IN_PLACE=false
	)
	cmake-utils_src_configure
}
