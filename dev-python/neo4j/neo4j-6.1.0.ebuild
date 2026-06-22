# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PN="neo4j-python-driver"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Neo4j Bolt driver for Python"
HOMEPAGE="
	https://pypi.org/project/neo4j/
	https://github.com/neo4j/neo4j-python-driver
"
SRC_URI="https://github.com/neo4j/neo4j-python-driver/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
S="${WORKDIR}"/${MY_P}
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
