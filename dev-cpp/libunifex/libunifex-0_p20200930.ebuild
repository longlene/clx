# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="862f56e765a90475190d5e0debce146f27d3d3a2"

DESCRIPTION="Unified Executors"
HOMEPAGE="https://github.com/facebookexperimental/libunifex"
SRC_URI="https://github.com/facebookexperimental/libunifex/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="uring"

DEPEND="
	uring? ( sys-libs/liburing )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DUNIFEX_BUILD_EXAMPLES=OFF
		-DUNIFEX_NO_LIBURING=$(usex ! uring)
	)
	cmake-utils_src_configure
}

src_install() {
	insinto /usr/include
	doins -r include/unifex
	dolib.so ${BUILD_DIR}/source/libunifex.so
	dodoc README.md
}
