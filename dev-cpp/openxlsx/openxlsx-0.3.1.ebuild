# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files"
HOMEPAGE="https://github.com/troldal/OpenXLSX"
SRC_URI="https://github.com/troldal/OpenXLSX/archive/refs/tags/v0.3.1.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DOPENXLSX_CREATE_DOCS=OFF
		-DOPENXLSX_BUILD_SAMPLES=OFF
		-DOPENXLSX_BUILD_TESTS=OFF
		-DOPENXLSX_BUILD_BENCHMARKS=OFF
	)
	cmake_src_configure
}
