# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Build powerful and customized data-driven back-end applications"
HOMEPAGE="https://github.com/Avaiga/taipy https://pypi.org/project/taipy-core/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="$(python_gen_cond_dep '
	>=dev-python/boto3-1.29.4[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.6[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	>=dev-python/pandas-2.2[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-16.0.0[${PYTHON_USEDEP}]
	>=dev-python/pymongo-4.2.0[srv(+),${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.16[${PYTHON_USEDEP}]
	>=dev-python/taipy-common-4.1[${PYTHON_USEDEP}]
	>=dev-python/toml-0.10[${PYTHON_USEDEP}]
')"
