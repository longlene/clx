# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A TensorRT Toolbox for Large Language Models"
HOMEPAGE="
	https://github.com/NVIDIA/TensorRT-LLM
"
SRC_URI="https://github.com/NVIDIA/TensorRT-LLM/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/TensorRT-LLM-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/accelerate-0.25.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/diffusers-0.27.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/colored[${PYTHON_USEDEP}]
		dev-python/cuda-python[${PYTHON_USEDEP}]
		dev-python/lark[${PYTHON_USEDEP}]
		dev-python/mpi4py[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=sci-ml/onnx-1.12.0[${PYTHON_USEDEP}]
		>=dev-python/onnx-graphsurgeon-0.5.2[${PYTHON_USEDEP}]
		dev-python/openai[${PYTHON_USEDEP}]
		dev-python/polygraphy[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		>=dev-python/pynvml-11.5.0[${PYTHON_USEDEP}]
		dev-python/pulp[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
		>=dev-python/h5py-3.12.1[${PYTHON_USEDEP}]
		dev-python/strenum[${PYTHON_USEDEP}]
		>=dev-python/sentencepiece-0.1.99[${PYTHON_USEDEP}]
		>=dev-python/tensorrt-10.8.0[${PYTHON_USEDEP}]
		>=dev-python/pytorch-2.5.1[${PYTHON_USEDEP}]
		dev-python/torchvision[${PYTHON_USEDEP}]
		>=dev-python/nvidia-modelopt-0.23.0[${PYTHON_USEDEP}]
		dev-python/nccl[${PYTHON_USEDEP}]
		>=dev-python/transformers-4.47.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.9.1[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.3.0[${PYTHON_USEDEP}]
		sci-ml/optimum[${PYTHON_USEDEP}]
		sci-ml/evaluate[${PYTHON_USEDEP}]
		>=dev-python/mpmath-1.3.0[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/click-option-group[${PYTHON_USEDEP}]
		dev-python/aenum[${PYTHON_USEDEP}]
		dev-python/pyzmq[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.4[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/ordered-set[${PYTHON_USEDEP}]
		dev-python/flashinfer[${PYTHON_USEDEP}]
		dev-python/s2wrapper[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/wheel[${PYTHON_USEDEP}]
	')
"
#BDEPEND+="
#	test? (
#	)
#"

distutils_enable_tests pytest

src_prepare() {
	# C++ bindings are built separately; skip check that aborts setup.py
	# when the pre-compiled bindings directory is absent in a source tree.
	sed -i 's/^sanity_check()$/pass  # sanity_check() skipped by ebuild/' setup.py || die
	# Exclude examples/ from installed packages — distutils-r1 forbids top-level
	# packages named 'examples', 'test', or 'tests' in site-packages.
	sed -i 's/^packages = find_packages()$/packages = find_packages(exclude=["examples", "examples.*"])/' setup.py || die
	distutils-r1_src_prepare
}
