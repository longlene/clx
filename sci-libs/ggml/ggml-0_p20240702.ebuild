# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="e3b3846976c94163f2b3dd128cc959782653edbb"

DESCRIPTION="Tensor library for machine learning"
HOMEPAGE="https://github.com/ggerganov/ggml"
SRC_URI="https://github.com/ggerganov/ggml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="blas cuda curl vulkan"

DEPEND="
	blas? ( sci-libs/openblas )
	vulkan? ( media-libs/mesa[vulkan] )
"
RDEPEND="${DEPEND}"
BDEPEND=""

#src_prepare() {
#	default
#	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
#		-i src/CMakeLists.txt
#	cmake_src_prepare
#}

src_configure() {
	local mycmakeargs=(
		-DGGML_BUILD_TESTS=OFF
		-DGGML_BUILD_EXAMPLES=OFF
		-DGGML_BLAS=$(usex blas)
		-DGGML_CUDA=$(usex cuda)
		-DGGML_CURL=$(usex curl)
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_CCACHE=OFF
	)
	cmake_src_configure
}
