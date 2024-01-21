# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1 pypi

DESCRIPTION="Multilingual Automatic Speech Recognition with word-level timestamps and confidence"
HOMEPAGE="https://github.com/linto-ai/whisper-timestamped"
SRC_URI="https://github.com/linto-ai/whisper-timestamped/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/dtw-python[${PYTHON_USEDEP}]
	dev-python/openai-whisper[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"

S="${WORKDIR}"/${P}
