# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="6673a4c71fe35e077c6843a74017d9c25610c537"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/Maratyszcza/pthreadpool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DPTHREADPOOL_LIBRARY_TYPE=shared
	-DPTHREADPOOL_BUILD_TESTS=OFF
	-DPTHREADPOOL_BUILD_BENCHMARKS=OFF
	)
	cmake-utils_src_configure
}

src_install() {
	dolib.so ${BUILD_DIR}/lib${PN}.so
	insinto /usr/include
	doins include/pthreadpool.h
	dodoc README.md
}
