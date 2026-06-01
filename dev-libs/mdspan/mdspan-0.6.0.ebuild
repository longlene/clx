# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Reference implementation of mdspan targeting C++23"
HOMEPAGE="https://github.com/kokkos/mdspan"
SRC_URI="https://github.com/kokkos/mdspan/archive/refs/tags/mdspan-${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/mdspan-mdspan-${PV}"

LICENSE="Apache-2.0-with-LLVM-exceptions"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	local mycmakeargs=(
		-DMDSPAN_ENABLE_TESTS=OFF
		-DMDSPAN_ENABLE_EXAMPLES=OFF
		-DMDSPAN_ENABLE_BENCHMARKS=OFF
		-DMDSPAN_ENABLE_COMP_BENCH=OFF
	)
	cmake_src_configure
}
