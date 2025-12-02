# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="pgvector support for Python"
HOMEPAGE="
	https://pypi.org/project/pgvector/
	https://github.com/pgvector/pgvector-python
"
SRC_URI="https://github.com/pgvector/pgvector-python/archive/refs/tags/v${PV}.tar.gz -> ${PN}-python-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-python-${PV}
