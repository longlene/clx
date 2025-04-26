# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Trame lets you weave various components and technologies into a Web Application solely written in Python"
HOMEPAGE="
	https://pypi.org/project/trame/
	https://github.com/Kitware/trame
"
SRC_URI="https://github.com/Kitware/trame/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/trame-server-3.2.3[${PYTHON_USEDEP}]
	>=dev-python/trame-client-3.4[${PYTHON_USEDEP}]
	>=dev-python/wslink-2.1.3[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
