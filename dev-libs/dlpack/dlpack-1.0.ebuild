# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Open In Memory Tensor Structure"
HOMEPAGE="https://github.com/dmlc/dlpack"
SRC_URI="https://github.com/dmlc/dlpack/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_MOCK=OFF
	)
	cmake_src_configure
}
