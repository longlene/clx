# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

COMMIT="236f4f9d5651c47598f2a459ac0ddc4aa4a4e594"

DESCRIPTION="LLM pretraining framework authored end-to-end by an AI agent loop"
HOMEPAGE="https://github.com/OpenBMB/ForgeTrain"
SRC_URI="https://github.com/OpenBMB/ForgeTrain/archive/${COMMIT}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/ForgeTrain-${COMMIT}/exports/train_engine_0.5B"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformer-engine[${PYTHON_SINGLE_USEDEP},pytorch]
	$(python_gen_cond_dep '
		>=dev-python/triton-3.3[${PYTHON_USEDEP}]
		>=dev-python/nvidia-cutlass-dsl-4.4.2[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
