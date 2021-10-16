# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/Murii/CLove/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-games/physfs
	dev-lang/lua
	media-libs/freetype
	media-libs/glew
	media-libs/libsdl2
	media-libs/openal
	sys-libs/zlib
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/add_subdirectory/{/src\/3rdparty\/zlib/d}' \
		-e '/add_subdirectory/{/src\/3rdparty\/freetype/d}' \
		-e '/add_subdirectory/{/src\/3rdparty\/physfs/d}' \
		-e '/add_subdirectory/{/src\/3rdparty\/openal/d}' \
		-e '/add_subdirectory/{/src\/3rdparty\/lua/d}' \
		-e '/add_subdirectory/{/src\/3rdparty\/glew/d}' \
		-e '/add_subdirectory/{/src\/3rdparty\/SDL2/d}' \
		-e '/set/{s#zlibstatic#z#}' \
		-e '/set/{s#libglew_static#GLEW#}' \
		-e '/set/{s#LUA_LIBRARIES lua#LUA_LIBRARIES lua m#}' \
		-i CMakeLists.txt
}

src_install() {
	dobin ${BUILD_DIR}/clove
	dodoc README.md
}
