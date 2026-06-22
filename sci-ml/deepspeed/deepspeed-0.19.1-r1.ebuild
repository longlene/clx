# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

PATCHES=(
	"${FILESDIR}"/${PN}-0.19.1-fix-nccl-attr.patch
)

DESCRIPTION="Deep learning optimization library for distributed training and inference"
HOMEPAGE="https://www.deepspeed.ai/ https://github.com/deepspeedai/DeepSpeed"
SRC_URI="https://github.com/deepspeedai/DeepSpeed/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/DeepSpeed-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="triton"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/hjson[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		triton? ( dev-python/triton[${PYTHON_USEDEP}] )
	')
"
BDEPEND="${PYTHON_DEPS}"
