# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="dd8247e53d4d58ddb24e2efb2cfd5d5b4e127876"

DESCRIPTION="Tiny Erlang VM"
HOMEPAGE="https://github.com/bettio/AtomVM"
SRC_URI="https://github.com/bettio/AtomVM/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/add_subdirectory/{/tests/d}' \
		-e '/add_subdirectory/{/libs/d}' \
		-e '/add_subdirectory/{/examples/d}' \
		-e '/add_subdirectory/{/doc/d}' \
		-i CMakeLists.txt
	cmake_src_prepare
}

src_install() {
	dobin ${BUILD_DIR}/{AtomVM,PackBEAM}
	dodoc README.Md
}
