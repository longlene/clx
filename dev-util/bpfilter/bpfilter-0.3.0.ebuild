# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="BPF-based packet filtering framework"
HOMEPAGE="https://github.com/facebook/bpfilter"
SRC_URI="https://github.com/facebook/bpfilter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libbpf
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_BUILD_TYPE=debug

src_configure() {
	local mycmakeargs=(
		-DNO_DOCS=ON
		-DNO_TESTS=ON
		-DNO_CHECKS=ON
		-DNO_BENCHMARKS=ON
	)
	cmake_src_configure
}
