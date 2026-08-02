# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_COMMIT="8ea5ca68761fcad8a6ef1fb67121770513e6cfd6"

DESCRIPTION="Train speculative decoding models and port them to SGLang"
HOMEPAGE="https://github.com/sgl-project/SpecForge"
SRC_URI="https://github.com/sgl-project/SpecForge/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/SpecForge-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="flash-attn"
RESTRICT="test"

src_prepare() {
	sed -i 's/exclude = \["configs\*/exclude = ["benchmarks*", "docs*", "configs*/' pyproject.toml || die
	distutils-r1_src_prepare
}

RDEPEND="
	dev-vcs/pre-commit[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchvision[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	sci-ml/datasets[${PYTHON_SINGLE_USEDEP}]
	sci-ml/accelerate[${PYTHON_SINGLE_USEDEP}]
	sci-ml/sglang[${PYTHON_SINGLE_USEDEP}]
	sci-ml/tensorboard[${PYTHON_SINGLE_USEDEP}]
	dev-python/yunchang[${PYTHON_SINGLE_USEDEP}]
	flash-attn? ( sci-ml/flash-attn[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		sci-ml/qwen-vl-utils[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/wandb[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/openai-harmony[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
	')
"
