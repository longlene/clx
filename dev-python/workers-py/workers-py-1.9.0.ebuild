# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="A set of libraries and tools for Python Workers"
HOMEPAGE="
	https://pypi.org/project/workers-py/
	https://github.com/cloudflare/workers-py/
"
SRC_URI="https://github.com/cloudflare/workers-py/archive/refs/tags/${PN}-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/${PN}-${PN}-v${PV}/packages/${PN}
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	dev-python/pyodide-cli[${PYTHON_USEDEP}]
	>=dev-python/pyjson5-1.6.0[${PYTHON_USEDEP}]
	dev-python/pyodide-py[${PYTHON_USEDEP}]
	>=dev-python/workers-runtime-sdk-0.1.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
