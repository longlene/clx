# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Python toolkit for the Qwen3-ASR API with parallel transcription support"
HOMEPAGE="https://github.com/QwenLM/Qwen3-ASR-Toolkit"
SRC_URI="https://github.com/QwenLM/Qwen3-ASR-Toolkit/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/Qwen3-ASR-Toolkit-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	sci-ml/silero-vad[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
	dev-python/dashscope[${PYTHON_USEDEP}]
	dev-python/librosa[${PYTHON_USEDEP}]
	dev-python/soundfile[${PYTHON_USEDEP}]
	dev-python/pydub[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/srt[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
')"
