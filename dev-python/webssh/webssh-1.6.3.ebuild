# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Web based ssh client"
HOMEPAGE="
	https://pypi.org/project/webssh/
	https://github.com/huashengdun/webssh
"
SRC_URI="https://github.com/huashengdun/webssh/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/tornado-4.5.0[${PYTHON_USEDEP}]
	>=dev-python/paramiko-2.3.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
