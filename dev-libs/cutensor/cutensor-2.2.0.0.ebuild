# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A High-Performance CUDA Library For Tensor Primitives"
HOMEPAGE="https://docs.nvidia.com/cuda/cutensor/"
SRC_URI="https://developer.download.nvidia.com/compute/cutensor/redist/libcutensor/linux-x86_64/libcutensor-linux-x86_64-${PV}-archive.tar.xz"

LICENSE="NVIDIA-CUDA"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-util/nvidia-cuda-toolkit
"
BDEPEND=""

S="${WORKDIR}"/libcutensor-linux-x86_64-${PV}-archive

QA_PREBUILT="
	/usr/lib*/libcutensor*.so*
"

src_install() {
	doheader -r include/cutensor{,.h,Mg.h}
	dolib.so lib/12/libcutensor{,Mg}.so*
	einstalldocs
}
