# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Simple, Pythonic remote execution and deployment"
HOMEPAGE="
	https://pypi.org/project/fabric/
	https://github.com/fabric/fabric
	http://fabfile.org/
"
SRC_URI="https://github.com/fabric/fabric/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/invoke-3.0[${PYTHON_USEDEP}]
	>=dev-python/paramiko-2.4[${PYTHON_USEDEP}]
	>=dev-python/decorator-5[${PYTHON_USEDEP}]
	>=dev-python/deprecated-1.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
