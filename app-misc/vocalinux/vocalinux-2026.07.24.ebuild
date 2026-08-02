# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

# Upstream uses a nightly date tag (e.g. nightly-2026-07-17).
# PV=2026.07.17 (from filename) gets converted to nightly-2026-07-17 at runtime.

DESCRIPTION="Voice dictation system for Linux"
HOMEPAGE="https://github.com/jatinkrmalik/vocalinux"
SRC_URI="https://github.com/jatinkrmalik/vocalinux/archive/refs/tags/nightly-${PV//./-}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/vocalinux-nightly-${PV//./-}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="dev whisper vad"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/vosk-0.3.45[${PYTHON_USEDEP}]
		>=dev-python/pywhispercpp-1.2.0[${PYTHON_USEDEP}]
		>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/pynput-1.7.6[${PYTHON_USEDEP}]
		>=dev-python/requests-2.28.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.22.0[${PYTHON_USEDEP}]
		>=dev-python/pyaudio-0.2.13[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.9.0[${PYTHON_USEDEP}]
		>=dev-python/lxml-6.1.0[${PYTHON_USEDEP}]
		dev-python/evdev[${PYTHON_USEDEP}]
		dev-python/python-xlib[${PYTHON_USEDEP}]
		dev-python/pygobject[${PYTHON_USEDEP}]
		whisper? (
			>=sci-ml/openai-whisper-20231117[${PYTHON_USEDEP}]
			>=sci-ml/pytorch-2.0.0[${PYTHON_SINGLE_USEDEP}]
			>=sci-ml/torchaudio-2.0.0[${PYTHON_SINGLE_USEDEP}]
		)
		vad? ( >=dev-python/onnxruntime-1.16.0[${PYTHON_USEDEP}] )
	')
"
