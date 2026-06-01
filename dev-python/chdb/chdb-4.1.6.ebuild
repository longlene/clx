# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="An in-process OLAP SQL Engine powered by ClickHouse"
HOMEPAGE="
	https://pypi.org/project/chdb/
	https://github.com/chdb-io/chdb/
"
SRC_URI="https://github.com/chdb-io/chdb/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/chdb-core-26.1.0[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-13.0.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
