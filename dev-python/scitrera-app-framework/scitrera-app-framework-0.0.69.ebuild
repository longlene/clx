# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Common application framework code and utilities"
HOMEPAGE="https://github.com/scitrera/python-app-framework"
SRC_URI="https://github.com/scitrera/python-app-framework/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/python-app-framework-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/botwinick-utils-0.0.20[${PYTHON_USEDEP}]
	>=dev-python/python-json-logger-4.0.0[${PYTHON_USEDEP}]
	dev-python/vpd[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-asyncio )
distutils_enable_tests pytest
