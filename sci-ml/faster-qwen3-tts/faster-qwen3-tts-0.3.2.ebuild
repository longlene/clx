# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Real-time text-to-speech with Qwen3-TTS"
HOMEPAGE="
	https://pypi.org/project/faster-qwen3-tts/
	https://github.com/andimarafioti/faster-qwen3-tts
"
SRC_URI="https://github.com/andimarafioti/faster-qwen3-tts/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ggml"

RDEPEND="
	>=sci-ml/qwen-tts-0.1.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.57[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.5.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.36.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
	')
	ggml? ( >=sci-ml/qwentts-cpp-python-0.3.1[${PYTHON_SINGLE_USEDEP}] )
"
RESTRICT="test"
