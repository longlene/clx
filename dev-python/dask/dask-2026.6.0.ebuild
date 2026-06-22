# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Parallel PyData with Task Scheduling"
HOMEPAGE="
	https://www.dask.org/
	https://github.com/dask/dask
	https://pypi.org/project/dask/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="array dataframe diagnostics"
REQUIRED_USE="dataframe? ( array )"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/click-8.1[${PYTHON_USEDEP}]
		>=dev-python/cloudpickle-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/fsspec-2021.9.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
		>=dev-python/partd-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.4.1[${PYTHON_USEDEP}]
		>=dev-python/toolz-0.12.0[${PYTHON_USEDEP}]
		array? (
			>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
		)
		dataframe? (
			>=dev-python/pandas-2.0[${PYTHON_USEDEP}]
			>=dev-python/pyarrow-16.0[${PYTHON_USEDEP}]
		)
		diagnostics? (
			>=dev-python/bokeh-3.1.0[${PYTHON_USEDEP}]
			>=dev-python/jinja2-2.10.3[${PYTHON_USEDEP}]
		)
	')
"

RESTRICT="test"
