# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Converts text to speech in real-time with multiple TTS engine backends"
HOMEPAGE="https://github.com/KoljaB/RealtimeTTS"
SRC_URI="https://github.com/KoljaB/RealtimeTTS/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/RealtimeTTS-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="edge gtts openai"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	dev-python/stream2sentence[${PYTHON_USEDEP}]
	dev-python/pydub[${PYTHON_USEDEP}]
	>=dev-python/pyaudio-0.2.14[${PYTHON_USEDEP}]
	dev-python/resampy[${PYTHON_USEDEP}]
	edge? ( dev-python/edge-tts[${PYTHON_USEDEP}] )
	gtts? ( >=dev-python/gtts-2.5.4[${PYTHON_USEDEP}] )
	openai? ( >=dev-python/openai-2.38.0[${PYTHON_USEDEP}] )
')"
