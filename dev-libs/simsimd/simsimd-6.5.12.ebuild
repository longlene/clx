# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SIMD-accelerated Similarity Kernels"
HOMEPAGE="https://github.com/ashvardanian/SimSIMD"
SRC_URI="https://github.com/ashvardanian/SimSIMD/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/SimSIMD-${PV}

src_prepare() {
	default
	sed -e '/install/{/share\/doc/d}' \
		-i CMakeLists.txt
	rm README.md
	cmake_src_prepare
}
