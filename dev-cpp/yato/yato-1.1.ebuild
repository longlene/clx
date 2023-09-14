# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Cross-platform STL-styled and STL-compatible library"
HOMEPAGE="https://github.com/agruzdev/Yato"
SRC_URI="https://github.com/agruzdev/Yato/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		#-DYATO_BUILD_CONFIG=ON
		#-DYATO_BUILD_ACTORS=ON
		#-DYATO_ACTORS_WITH_IO=ON
		-DYATO_BUILD_TESTS=OFF
	)
	cmake_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/yato
	dodoc README.md
}
