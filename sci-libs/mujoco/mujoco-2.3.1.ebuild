# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Multi-Joint dynamics with Contact"
HOMEPAGE="https://mujoco.org/"
SRC_URI="https://github.com/deepmind/mujoco/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT=network-sandbox

src_configure() {
	local mycmakeargs=(
		-DMUJOCO_BUILD_EXAMPLES=OFF
		-DMUJOCO_BUILD_SIMULATE=OFF
		-DMUJOCO_BUILD_TESTS=OFF
		-DMUJOCO_TEST_PYTHON_UTIL=OFF
	)
	cmake_src_configure
}
