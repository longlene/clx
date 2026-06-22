# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="2af88863614a8298689cc52b1a47b3fcad7be835"

DESCRIPTION="The ruy matrix multiplication library"
HOMEPAGE="https://github.com/google/ruy"
SRC_URI="https://github.com/google/ruy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/cpuinfo
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DRUY_FIND_CPUINFO=ON
		-DRUY_MINIMAL_BUILD=ON
	)
	cmake_src_configure
}
