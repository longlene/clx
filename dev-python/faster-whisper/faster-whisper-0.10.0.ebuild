# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="Faster Whisper transcription with CTranslate2"
HOMEPAGE="https://github.com/guillaumekln/faster-whisper"
SRC_URI="https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/av-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/ctranslate2-3.22[${PYTHON_USEDEP}]
	>=dev-python/huggingface_hub-0.13[${PYTHON_USEDEP}]
	>=dev-python/tokenizers-0.13[${PYTHON_USEDEP}]
	>=dev-python/onnxruntime-1.14[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/black[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
