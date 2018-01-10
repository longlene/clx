# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A simple and easy-to-use library to learn videogames programming"
HOMEPAGE="http://www.raylib.com"
SRC_URI="https://github.com/raysan5/raylib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

DEPEND="
	media-libs/glfw
	media-libs/openal
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i "s#LIBRARY DESTINATION lib#LIBRARY DESTINATION $(get_libdir)#" src/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_EXAMPLES=OFF
	-DBUILD_GAMES=OFF
	-DSHARED_RAYLIB=$(usex !static-libs)
	)
	cmake-utils_src_configure
}
