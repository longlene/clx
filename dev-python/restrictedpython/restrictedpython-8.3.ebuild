# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A restricted execution environment for Python to run untrusted code"
HOMEPAGE="
	https://pypi.org/project/restrictedpython/
	https://github.com/zopefoundation/RestrictedPython
"
SRC_URI="https://github.com/zopefoundation/RestrictedPython/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}"/RestrictedPython-${PV}

LICENSE="ZPL"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	test? (
		dev-python/pytest
		dev-python/pytest-mock
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
