# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="tiny-2.27m-20260804"

DESCRIPTION="Numpy-only inference runtime and CLI for tiny neural TTS voices"
HOMEPAGE="https://github.com/Ampixa/sanoTTS"
SRC_URI="https://github.com/Ampixa/sanoTTS/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/sanoTTS-${MY_PV}/pypkg"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/espeakng-loader-0.2[${PYTHON_USEDEP}]
	>=sci-ml/phonemizer-3.3[${PYTHON_USEDEP}]
"
