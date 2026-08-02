# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_PV="pyiceberg-${PV}"

DESCRIPTION="Apache Iceberg open table format for huge analytic datasets"
HOMEPAGE="https://github.com/apache/iceberg-python"
SRC_URI="https://github.com/apache/iceberg-python/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/iceberg-python-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	>=dev-python/mmh3-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	>=dev-python/click-7.1.1[${PYTHON_USEDEP}]
	>=dev-python/rich-10.11.0[${PYTHON_USEDEP}]
	>=dev-python/strictyaml-1.7.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	>=dev-python/pyroaring-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.5[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.13.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.0.0[${PYTHON_USEDEP}]
"
