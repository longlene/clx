# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Lightweight and modular C++11 graphics middleware for games and data visualization"
HOMEPAGE="https://magnum.graphics/"
SRC_URI="https://github.com/mosra/magnum/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/corrade
	media-libs/openal
	media-libs/glfw
	media-libs/libsdl2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DWITH_AUDIO=ON
		-DWITH_GLXAPPLICATION=ON
		-DWITH_GLFWAPPLICATION=ON
		-DWITH_SDL2APPLICATION=ON
		-DWITH_WINDOWLESSGLXAPPLICATION=ON
		-DWITH_EGLCONTEXT=ON
		-DWITH_GLXCONTEXT=ON
		-DWITH_OPENGLTESTER=ON
		-DWITH_ANYAUDIOIMPORTER=ON
		-DWITH_ANYIMAGECONVERTER=ON
		-DWITH_ANYIMAGEIMPORTER=ON
		-DWITH_ANYSCENEIMPORTER=ON
		-DWITH_MAGNUMFONT=ON
		-DWITH_MAGNUMFONTCONVERTER=ON
		-DWITH_OBJIMPORTER=ON
		-DWITH_TGAIMAGECONVERTER=ON
		-DWITH_TGAIMPORTER=ON
		-DWITH_WAVAUDIOIMPORTER=ON
		-DWITH_DISTANCEFIELDCONVERTER=ON
		-DWITH_IMAGECONVERTER=ON
		-DWITH_SCENECONVERTER=ON
		-DWITH_FONTCONVERTER=ON
		-DWITH_GL_INFO=ON
		-DWITH_AL_INFO=ON
	)
	cmake_src_configure
}
