# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_COMMIT="9dbe7ea26a01b30fccb117ae5e86807c1dc23d42"
MY_GGML_COMMIT="3db69b47b5b4939fb099c707e359174b5e41bde0"

DESCRIPTION="C++ TTS inference library with CPU/CUDA/Vulkan backends (qwentts.cpp)"
HOMEPAGE="https://github.com/ServeurpersoCom/qwentts.cpp"
SRC_URI="
	https://github.com/ServeurpersoCom/qwentts.cpp/archive/${MY_COMMIT}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/ServeurpersoCom/ggml/archive/${MY_GGML_COMMIT}.tar.gz
		-> ${PN}-ggml-${MY_GGML_COMMIT:0:8}.gh.tar.gz
"

S="${WORKDIR}/qwentts.cpp-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda vulkan"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	vulkan? ( media-libs/vulkan-loader:= )
"
RDEPEND="${DEPEND}"

src_prepare() {
	# Populate ggml submodule directory from separately fetched tarball
	rmdir "${S}/ggml" || die
	mv "${WORKDIR}/ggml-${MY_GGML_COMMIT}" "${S}/ggml" || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DQWEN_SHARED=ON
		-DGGML_CUDA=$(usex cuda)
		-DGGML_VULKAN=$(usex vulkan)
		-DGGML_BLAS=OFF
		-DGGML_NATIVE=OFF
		-DCMAKE_INSTALL_LIBDIR="$(get_libdir)"
		-DCMAKE_INSTALL_RPATH="${EPREFIX}/usr/$(get_libdir)"
		-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
	)
	use cuda && mycmakeargs+=(
		-DCMAKE_CUDA_ARCHITECTURES="75-virtual;80-virtual;86-real;89-real"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# qwentts.cpp has no cmake install() — install manually
	dolib.so "${BUILD_DIR}/libqwen.so"
	insinto /usr/include/qwentts
	doins src/qwen.h

	dobin "${BUILD_DIR}/quantize"
	dobin "${BUILD_DIR}/qwen-codec"
	dobin "${BUILD_DIR}/qwen-tts"
	dobin "${BUILD_DIR}/tts-server"
}
