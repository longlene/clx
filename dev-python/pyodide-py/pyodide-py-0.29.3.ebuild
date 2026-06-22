# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_P="pyodide-${PV}"

DESCRIPTION="A Python package providing core interpreter functionality for Pyodide"
HOMEPAGE="
	https://pypi.org/project/pyodide-py/
	https://github.com/pyodide/pyodide/
"
SRC_URI="https://github.com/pyodide/pyodide/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
S="${WORKDIR}"/${MY_P}/src/py
KEYWORDS="~amd64"

#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
