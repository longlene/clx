# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="3D physics engine for games"
HOMEPAGE="https://github.com/erincatto/box3d"
SRC_URI="https://github.com/erincatto/box3d/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="double-precision"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DBOX3D_SAMPLES=OFF
		-DBOX3D_BENCHMARKS=OFF
		-DBOX3D_DOCS=OFF
		-DBOX3D_UNIT_TESTS=OFF
		-DBOX3D_PROFILE=OFF
		-DBOX3D_DOUBLE_PRECISION=$(usex double-precision)
	)
	cmake_src_configure
}
