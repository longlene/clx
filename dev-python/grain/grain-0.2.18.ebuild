# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Library for reading and processing ML training data"
HOMEPAGE="https://github.com/google/grain"
SRC_URI="https://github.com/google/grain/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="parquet"
RESTRICT="test"

RDEPEND="
	dev-python/absl-py[${PYTHON_USEDEP}]
	dev-python/array-record[${PYTHON_USEDEP}]
	dev-python/cloudpickle[${PYTHON_USEDEP}]
	dev-python/etils[epath,${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/portpicker[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.28.3[${PYTHON_USEDEP}]
	parquet? ( dev-python/pyarrow[${PYTHON_USEDEP}] )
"
