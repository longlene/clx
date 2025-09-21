# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Tokenizer-Free TTS for Context-Aware Speech Generation and True-to-Life Voice Cloning"
HOMEPAGE="
	https://github.com/OpenBMB/VoxCPM
"
SRC_URI="https://github.com/OpenBMB/VoxCPM/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.5.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchaudio-2.5.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.36.2[${PYTHON_SINGLE_USEDEP}]
	dev-python/gradio[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/datasets-4[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	sci-ml/funasr[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/einops[${PYTHON_USEDEP}]
		dev-python/inflect[${PYTHON_USEDEP}]
		dev-python/addict[${PYTHON_USEDEP}]
		sci-ml/wetext[${PYTHON_USEDEP}]
		>=sci-ml/modelscope-1.22.0[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
		dev-python/sortedcontainers[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_VOXCPM="${PV}"

S="${WORKDIR}"/VoxCPM-${PV}
