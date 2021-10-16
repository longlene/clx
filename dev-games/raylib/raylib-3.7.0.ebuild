# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

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

src_configure() {
	local mycmakeargs=(
	-DUSE_EXTERNAL_GLFW=ON
	-DBUILD_EXAMPLES=OFF
	-DBUILD_GAMES=OFF
	-DSHARED=ON
	)
	cmake_src_configure
}
