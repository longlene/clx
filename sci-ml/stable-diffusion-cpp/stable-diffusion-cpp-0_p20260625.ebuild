# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_TAG="master-721-8caa3f9"
GGML_COMMIT="3af5f5760e19a96427f5f7a93b79cbdf3d4b265b"

DESCRIPTION="Diffusion model (SD, Flux, Wan, ...) inference in pure C/C++"
HOMEPAGE="https://github.com/leejet/stable-diffusion.cpp"
SRC_URI="
	https://github.com/leejet/stable-diffusion.cpp/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ggml-org/ggml/archive/${GGML_COMMIT}.tar.gz -> ggml-${GGML_COMMIT}.tar.gz
"

S="${WORKDIR}/stable-diffusion.cpp-${MY_TAG}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm vulkan"

DEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
	rocm? ( >=dev-util/hip-6.3:= )
	vulkan? ( media-libs/vulkan-loader )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cp -r "${WORKDIR}/ggml-${GGML_COMMIT}/." "${S}/ggml/" || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSD_CUDA=$(usex cuda)
		-DSD_HIPBLAS=$(usex rocm)
		-DSD_VULKAN=$(usex vulkan)
		-DSD_BUILD_SHARED_LIBS=ON
	)
	cmake_src_configure
}

src_install() {
	dolib.so "${BUILD_DIR}"/bin/libstable-diffusion.so
	dobin "${BUILD_DIR}"/bin/sd-cli
	dobin "${BUILD_DIR}"/bin/sd-server
	patchelf --remove-rpath "${ED}/usr/bin/sd-cli" || die
	patchelf --remove-rpath "${ED}/usr/bin/sd-server" || die
	einstalldocs
}
