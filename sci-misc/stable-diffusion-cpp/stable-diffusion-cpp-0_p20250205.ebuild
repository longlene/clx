# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="d46ed5e184b97c2018dc2e8105925bdb8775e02c"

DESCRIPTION="Stable Diffusion and Flux in pure C/C++"
HOMEPAGE="https://github.com/leejet/stable-diffusion.cpp"
SRC_URI="
	https://github.com/leejet/stable-diffusion.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda rocm sycl vulkan"

DEPEND="
	sci-libs/ggml[cuda?,rocm?,vulkan?]
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/stable-diffusion.cpp-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/system-ggml.patch
)

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
	dobin "${BUILD_DIR}"/bin/sd
	einstalldocs
}
