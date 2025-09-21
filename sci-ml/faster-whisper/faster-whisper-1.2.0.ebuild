# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Faster Whisper transcription with CTranslate2"
HOMEPAGE="https://github.com/SYSTRAN/faster-whisper"
SRC_URI="https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/tokenizers-0.13[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.13[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/ctranslate2-4.0.0[${PYTHON_USEDEP}]
		>=sci-libs/onnxruntime-1.14.0[${PYTHON_USEDEP}]
		>=dev-python/av-11.0.0[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/black[${PYTHON_USEDEP}]
			dev-python/flake8[${PYTHON_USEDEP}]
			dev-python/isort[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest
