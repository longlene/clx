# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="6b14d738d9100c50c199a3b1aaa960f633904476"

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://github.com/ggerganov/ggml"
SRC_URI="https://github.com/ggerganov/ggml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas"

DEPEND="
	blas? ( sci-libs/openblas )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i src/CMakeLists.txt
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DGGML_BUILD_TESTS=OFF
		-DGGML_BUILD_EXAMPLES=OFF
		-DGGML_OPENBLAS=$(usex blas)
	)
	cmake_src_configure
}
