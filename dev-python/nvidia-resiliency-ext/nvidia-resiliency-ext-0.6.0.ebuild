# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="NVIDIA Resiliency Extension"
HOMEPAGE="
	https://pypi.org/project/nvidia-resiliency-ext/
	https://github.com/NVIDIA/nvidia-resiliency-ext
"
SRC_URI="https://github.com/NVIDIA/nvidia-resiliency-ext/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-2.3.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26[${PYTHON_USEDEP}]
		>=dev-python/nvidia-ml-py-12.570.86[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-1.76.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-tools-1.76.0[${PYTHON_USEDEP}]
		>=dev-python/protobuf-4.22.0[${PYTHON_USEDEP}]
	')
"
BDEPEND="dev-util/nvidia-cuda-toolkit"

src_prepare() {
	# poetry-dynamic-versioning requires a git repo and has an incompatible
	# dunamai API (highest_tag renamed to latest_tag); use static poetry backend
	sed -i \
		-e 's|"poetry_dynamic_versioning\.backend"|"poetry.core.masonry.api"|' \
		-e 's|"poetry-dynamic-versioning\[backend\]>=1\.0\.0", *||' \
		pyproject.toml || die

	# build.py only adds the CUPTI include dir but cupti.h itself includes
	# cuda.h which lives in the main CUDA include dir
	sed -i \
		's|include_dirs = \[idir\]|include_dirs = [idir, os.path.join(cuda_path, "include")]|' \
		build.py || die

	distutils-r1_src_prepare
}

src_compile() {
	CUDA_PATH="/opt/cuda" distutils-r1_src_compile
}
