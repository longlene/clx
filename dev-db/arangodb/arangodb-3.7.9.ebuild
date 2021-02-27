# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A native multi-model database with flexible data models for documents, graphs, and key-values"
HOMEPAGE="https://www.arangodb.com/"
SRC_URI="https://github.com/arangodb/arangodb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="unwind"

DEPEND="
	app-arch/lzma
	unwind? ( sys-libs/libunwind )
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_BUILD_TYPE=Release
CMAKE_MAKEFILE_GENERATOR=emake

src_configure() {
	local mycmakeargs=(
		-DUSE_GOOGLE_TESTS=OFF
		-DUSE_LIBUNWIND=$(usex unwind)
	)
	cmake-utils_src_configure
}
