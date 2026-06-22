# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Cross-platform ahead-of-time Lua compiler and runtime"
HOMEPAGE="https://samyeyo.github.io/clx https://github.com/samyeyo/clx"
SRC_URI="https://github.com/samyeyo/clx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	# CMakeLists.txt hardcodes /usr/local prefix on non-Windows; cmake eclass overrides
	# via CACHE but the non-CACHE set() also fires — remove it to avoid confusion
	sed -i '/set(CMAKE_INSTALL_PREFIX \/usr\/local)/d' CMakeLists.txt || die
	cmake_src_prepare
}
