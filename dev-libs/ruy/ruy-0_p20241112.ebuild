# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="9889171210b81138fd15fb57dd06e98fe6d37b3c"

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
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DRUY_FIND_CPUINFO=ON
		-DRUY_MINIMAL_BUILD=ON
	)
	cmake_src_configure
}
