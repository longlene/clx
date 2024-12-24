# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Whisper command line client compatible with original OpenAI client based on CTranslate2"
HOMEPAGE="
	https://github.com/Softcatala/whisper-ctranslate2
"
SRC_URI="https://github.com/Softcatala/whisper-ctranslate2/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test" # Need some modules, not yet packaged

RDEPEND="
	>=sci-libs/faster-whisper-1.1.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/ctranslate2[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/sounddevice[${PYTHON_USEDEP}]
	')
"

distutils_enable_tests pytest
