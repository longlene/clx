# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Hackable implementation of state-of-the-art open-source LLMs"
HOMEPAGE="
	https://lightning.ai
	https://github.com/Lightning-AI/litgpt
	https://pypi.org/project/litgpt/
"
SRC_URI="https://github.com/Lightning-AI/litgpt/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="extra"
RESTRICT="test"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tokenizers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/jsonargparse-4.37[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		>=sci-ml/lightning-2.5[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
	')
	extra? (
		sci-ml/bitsandbytes[${PYTHON_SINGLE_USEDEP}]
		sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
		sci-ml/lm-eval[${PYTHON_SINGLE_USEDEP}]
		sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
		sci-ml/torchmetrics[${PYTHON_SINGLE_USEDEP}]
		sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
		$(python_gen_cond_dep '
			dev-python/pandas[${PYTHON_USEDEP}]
			dev-python/pyarrow[${PYTHON_USEDEP}]
			dev-python/requests[${PYTHON_USEDEP}]
			sci-ml/sentencepiece[python(+),${PYTHON_USEDEP}]
			dev-python/uvloop[${PYTHON_USEDEP}]
			dev-python/zstandard[${PYTHON_USEDEP}]
		')
	)
"
BDEPEND="${PYTHON_DEPS}"
