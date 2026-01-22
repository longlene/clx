# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Python SDK for running AI-generated code/code interpreting in your AI app"
HOMEPAGE="
	https://pypi.org/project/e2b-code-interpreter/
	https://github.com/e2b-dev/code-interpreter
"
SRC_URI="https://github.com/e2b-dev/code-interpreter/archive/refs/tags/@e2b/code-interpreter-python@${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/httpx-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-21.3.0[${PYTHON_USEDEP}]
	>=dev-python/e2b-2.7.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/code-interpreter--e2b-code-interpreter-python-${PV}/python
