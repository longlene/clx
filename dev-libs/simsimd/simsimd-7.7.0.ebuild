# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SIMD-accelerated Similarity Kernels"
HOMEPAGE="https://github.com/ashvardanian/SimSIMD"
SRC_URI="https://github.com/ashvardanian/SimSIMD/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/NumKong-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_prepare() {
	sed -e '/install/{/share\/doc/d}' \
		-i CMakeLists.txt || die
	cmake_src_prepare
}
