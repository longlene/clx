# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A command line utility for building fully self contained Python zipapps"
HOMEPAGE="
	https://pypi.org/project/shiv/
	https://github.com/linkedin/shiv
"
SRC_URI="https://github.com/linkedin/shiv/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-6.7[${PYTHON_USEDEP}]
	>=dev-python/pip-9.0.3[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
