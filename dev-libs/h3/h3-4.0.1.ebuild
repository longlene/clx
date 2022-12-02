# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hexagonal hierarchical geospatial indexing system"
HOMEPAGE="https://h3geo.org/"
SRC_URI="https://github.com/uber/h3/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION \"lib\"#DESTINATION $(get_libdir)#" \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_BENCHMARKS=OFF
		-DBUILD_FUZZERS=OFF
	)
	cmake_src_configure
}
