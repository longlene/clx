# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="DVC's data management subsystem"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc-data
	https://pypi.org/project/dvc-data/
"
SRC_URI="https://github.com/iterative/dvc-data/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/attrs-21.3.0[${PYTHON_USEDEP}]
	>=dev-python/dictdiffer-0.8.1[${PYTHON_USEDEP}]
	>=dev-python/diskcache-5.2.1[${PYTHON_USEDEP}]
	>=dev-python/dvc-objects-4.0.1[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2024.2.0[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/sqltrie-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.63.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3[${PYTHON_USEDEP}]
"
RESTRICT="test"
