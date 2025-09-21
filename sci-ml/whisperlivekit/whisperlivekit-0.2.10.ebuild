# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Real-time speech-to-text with speaker diarization using Whisper"
HOMEPAGE="https://github.com/QuentinFuxa/WhisperLiveKit"
SRC_URI="https://github.com/QuentinFuxa/WhisperLiveKit/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-ml/faster-whisper[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	|| (
		dev-python/triton-bin[${PYTHON_SINGLE_USEDEP}]
		dev-python/triton[${PYTHON_SINGLE_USEDEP}]
	)
	$(python_gen_cond_dep '
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/librosa[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/WhisperLiveKit-${PV}
