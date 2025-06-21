# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Python command line wrapper for pyright"
HOMEPAGE="
	https://pypi.org/project/pyright/
	https://github.com/RobertCraigie/pyright-python
"
SRC_URI="https://github.com/RobertCraigie/pyright-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/nodeenv-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-python-${PV}
