# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="$(ver_rs 3 -)"

DESCRIPTION="Optimized primitives for collective multi-GPU communication"
HOMEPAGE="https://github.com/NVIDIA/nccl"
SRC_URI="https://github.com/NVIDIA/nccl/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="NVIDIA-r2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-util/nvidia-cuda-toolkit
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/nccl-${MY_PV}

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)

src_compile() {
	emake CUDA_HOME=/opt/cuda
}

src_install() {
	emake PREFIX="${D}"/usr INSTALL_LIBDIR="$(get_libdir)" install
}
