# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Making Megatron training as simple as Transformers"
HOMEPAGE="
	https://pypi.org/project/mcore-bridge/
	https://github.com/modelscope/mcore-bridge
"
SRC_URI="https://github.com/modelscope/mcore-bridge/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/megatron-lm-0.15.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.11[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.33[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/modelscope[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
RESTRICT="test"
