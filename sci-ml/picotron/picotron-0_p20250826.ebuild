# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Minimalistic 4D-parallelism distributed training framework for education"
HOMEPAGE="https://github.com/huggingface/picotron"
SRC_URI="https://github.com/huggingface/picotron/archive/59714b1bf25541dbeb6f5a721ed15f6d0768e786.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/picotron-59714b1bf25541dbeb6f5a721ed15f6d0768e786"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/flash-attn[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/triton[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"
