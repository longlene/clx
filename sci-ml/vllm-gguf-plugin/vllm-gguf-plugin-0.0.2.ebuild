# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Out-of-tree GGUF quantization plugin for vLLM"
HOMEPAGE="https://github.com/vllm-project/vllm-gguf-plugin"
SRC_URI="https://github.com/vllm-project/vllm-gguf-plugin/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/vllm[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/gguf[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
BDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
"
