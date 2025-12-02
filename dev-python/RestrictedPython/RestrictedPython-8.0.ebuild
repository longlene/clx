# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A restricted execution environment for Python to run untrusted code"
HOMEPAGE="
	https://pypi.org/project/RestrictedPython/
	https://github.com/zopefoundation/RestrictedPython
"
SRC_URI="https://github.com/zopefoundation/RestrictedPython/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ZPL-2.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
