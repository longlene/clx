# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Postmodern immutable and persistent data structures for C++"
HOMEPAGE="https://sinusoid.es/immer"
SRC_URI="https://github.com/arximboldi/immer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-Dimmer_BUILD_TESTS=OFF
		-Dimmer_BUILD_EXAMPLES=OFF
		-Dimmer_BUILD_DOCS=OFF
	)
	cmake_src_configure
}
