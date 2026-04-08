# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Simple text to phones converter for multiple languages"
HOMEPAGE="
	https://pypi.org/project/phonemizer/
	https://github.com/bootphon/phonemizer
"
SRC_URI="https://github.com/bootphon/phonemizer/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/segments[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.1[${PYTHON_USEDEP}]
	dev-python/dlinfo[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
