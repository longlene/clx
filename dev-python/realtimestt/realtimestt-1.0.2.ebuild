# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Low-latency speech-to-text with VAD, wake word, and instant transcription"
HOMEPAGE="https://github.com/KoljaB/RealtimeSTT"
SRC_URI="https://github.com/KoljaB/RealtimeSTT/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/RealtimeSTT-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="faster-whisper"
RESTRICT="test"

RDEPEND="
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/torchaudio[${PYTHON_SINGLE_USEDEP}]
	faster-whisper? ( sci-ml/faster-whisper[${PYTHON_SINGLE_USEDEP}] )
	$(python_gen_cond_dep '
		dev-python/halo[${PYTHON_USEDEP}]
		dev-python/pyaudio[${PYTHON_USEDEP}]
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/soundfile[${PYTHON_USEDEP}]
		dev-python/webrtcvad[${PYTHON_USEDEP}]
		dev-python/websocket-client[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
	')
"
