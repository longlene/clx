# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

SRC_URI="https://github.com/rapidsai/cuvs/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}"/cpp

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTS=OFF
		-DDETECT_CONDA_ENV=OFF
		-DCUVS_RAFT_CLONE_ON_PIN=OFF
	)
	cmake_src_configure
}
