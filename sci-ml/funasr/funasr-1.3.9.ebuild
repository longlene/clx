# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14}  )

inherit distutils-r1

DESCRIPTION="A Fundamental End-to-End Speech Recognition Toolkit"
HOMEPAGE="https://github.com/modelscope/FunASR"
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
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/jamo[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.1.2[${PYTHON_USEDEP}]
		>=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
		>=dev-python/kaldiio-2.17.0[${PYTHON_USEDEP}]
		sci-ml/torch-complex[${PYTHON_USEDEP}]
		sci-ml/sentencepiece[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
		dev-python/omegaconf[${PYTHON_USEDEP}]
		dev-python/jieba[${PYTHON_USEDEP}]
		>=dev-python/editdistance-0.5.2[${PYTHON_USEDEP}]
		dev-python/oss2[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/umap-learn[${PYTHON_USEDEP}]
		dev-python/jaconv[${PYTHON_USEDEP}]
		>=dev-python/hydra-1.3.2[${PYTHON_USEDEP}]
		sci-ml/tensorboardX[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		sci-ml/modelscope[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
