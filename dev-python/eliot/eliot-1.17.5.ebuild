# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="The logging system that tells you *why* it happened"
HOMEPAGE="
	https://pypi.org/project/eliot/
	https://github.com/itamarst/eliot
"
SRC_URI="https://github.com/itamarst/eliot/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/zope-interface[${PYTHON_USEDEP}]
	>=dev-python/pyrsistent-0.11.8[${PYTHON_USEDEP}]
	>=dev-python/boltons-19.0.1[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
