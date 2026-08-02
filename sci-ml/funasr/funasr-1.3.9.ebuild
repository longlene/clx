# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Industrial-grade speech recognition toolkit"
HOMEPAGE="
	https://github.com/modelscope/FunASR
	https://modelscope.github.io/FunASR
"
SRC_URI="https://github.com/modelscope/FunASR/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/FunASR-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/transformers[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/scipy-1.4.1[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1.2[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		>=dev-python/hydra-core-1.3.2[${PYTHON_USEDEP}]
		sci-ml/modelscope[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		>=dev-python/kaldiio-2.17.0[${PYTHON_USEDEP}]
		dev-python/jieba[${PYTHON_USEDEP}]
		dev-python/jamo[${PYTHON_USEDEP}]
		dev-python/jaconv[${PYTHON_USEDEP}]
		dev-python/umap-learn[${PYTHON_USEDEP}]
		>=dev-python/editdistance-0.5.2[${PYTHON_USEDEP}]
		sci-ml/torch-complex[${PYTHON_USEDEP}]
		sci-ml/tensorboardx[${PYTHON_USEDEP}]
		dev-python/oss2[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
