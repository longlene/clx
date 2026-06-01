# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="On-device AI across mobile, embedded and edge for PyTorch"
HOMEPAGE="https://executorch.ai"
SRC_URI="https://github.com/pytorch/executorch/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
# cmake requires the source dir to be named "executorch" for include resolution
S="${WORKDIR}/executorch"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda mlx openvino vulkan xnnpack"

DEPEND="
	dev-cpp/nlohmann_json
	dev-libs/cpuinfo
	dev-libs/flatbuffers
	dev-libs/pthreadpool
	dev-util/flatcc
	cuda? (
		dev-util/nvidia-cuda-toolkit
		sci-ml/caffe2
	)
	vulkan? (
		dev-util/vulkan-headers
		media-libs/VulkanMemoryAllocator
		media-libs/volk
	)
	xnnpack? ( sci-ml/XNNPACK )
	mlx? ( sci-ml/mlx )
"
RDEPEND="${DEPEND}
	openvino? ( sci-ml/openvino )
	vulkan? ( media-libs/vulkan-loader )
"

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

src_unpack() {
	default
	mv "${WORKDIR}/executorch-${PV}" "${WORKDIR}/executorch" || die
}

src_configure() {
	local mycmakeargs=(
		-DEXECUTORCH_BUILD_PTHREADPOOL=ON
		-DEXECUTORCH_BUILD_CPUINFO=ON
		-DEXECUTORCH_BUILD_CUDA=$(usex cuda)
		-DEXECUTORCH_BUILD_EXTENSION_TENSOR=$(usex cuda)
		-DEXECUTORCH_BUILD_OPENVINO=$(usex openvino)
		-DEXECUTORCH_BUILD_VULKAN=$(usex vulkan)
		-DEXECUTORCH_BUILD_XNNPACK=$(usex xnnpack)
		-DEXECUTORCH_BUILD_MLX=$(usex mlx)
	)
	cmake_src_configure
}
