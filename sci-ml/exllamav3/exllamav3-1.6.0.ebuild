# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Inference library for running local LLMs on modern consumer GPUs"
HOMEPAGE="https://github.com/turboderp-org/exllamav3"
SRC_URI="https://github.com/turboderp-org/exllamav3/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tokenizers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/llguidance[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/marisa-trie[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/triton[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	')
"
# The extension build imports torch (cpp_extension) and compiles with the CUDA toolkit
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/ninja
	dev-util/nvidia-cuda-toolkit
"

# setup.py's nvcc discovery (and torch cpp_extension) needs the toolkit prefix; the
# portage build PATH does not include /opt/cuda/bin
export CUDA_HOME="${EPREFIX}/opt/cuda"
