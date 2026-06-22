# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="High level expressions layer for Dask"
HOMEPAGE="https://dask.org https://github.com/dask/dask"
SRC_URI="https://github.com/dask/dask/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/dask-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="analyze"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/pandas-2[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-14.0.1[${PYTHON_USEDEP}]
		dev-python/dask[${PYTHON_USEDEP}]
		analyze? (
			dev-python/graphviz[${PYTHON_USEDEP}]
		)
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/setuptools-62.6[${PYTHON_USEDEP}]
		dev-python/versioneer[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"
