# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python library and CLI tool for Google Translate text-to-speech"
HOMEPAGE="https://github.com/pndurette/gTTS https://pypi.org/project/gTTS/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/click-7.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.27[${PYTHON_USEDEP}]
"
