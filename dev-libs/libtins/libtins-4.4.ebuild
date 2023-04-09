# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="High-level, multiplatform C++ network packet sniffing and crafting library"
HOMEPAGE="https://github.com/mfontanini/libtins"
SRC_URI="https://github.com/mfontanini/libtins/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/boost"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DLIBTINS_BUILD_EXAMPLES=OFF
		-DLIBTINS_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
