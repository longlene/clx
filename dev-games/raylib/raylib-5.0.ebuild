# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A simple and easy-to-use library to learn videogames programming"
HOMEPAGE="http://www.raylib.com"
SRC_URI="https://github.com/raysan5/raylib/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
#IUSE="static-libs"

DEPEND="
	virtual/opengl
"
#media-libs/glfw
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=OFF
		-DWITH_PIC=ON
		-DBUILD_SHARED_LIBS=ON
	)
	#-DUSE_EXTERNAL_GLFW=ON
	cmake_src_configure
}
