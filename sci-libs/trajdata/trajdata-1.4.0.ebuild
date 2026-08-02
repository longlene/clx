# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="A unified interface to many trajectory forecasting datasets"
HOMEPAGE="
	https://github.com/nvr-avg/trajdata
	https://pypi.org/project/trajdata/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="interaction lyft nusc"

RDEPEND="
	>=dev-python/numpy-1.19[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.62[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-3.5[${PYTHON_USEDEP}]
	>=dev-python/dill-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/pandas-1.4.1[${PYTHON_USEDEP}]
	>=dev-python/pyarrow-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/zarr-2.11.0[${PYTHON_USEDEP}]
	>=dev-python/kornia-0.6.4[${PYTHON_USEDEP}]
	>=dev-python/seaborn-0.12[${PYTHON_USEDEP}]
	>=dev-python/bokeh-3.0.3[${PYTHON_USEDEP}]
	>=dev-python/geopandas-0.13.2[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.9.0[${PYTHON_USEDEP}]
	media-libs/opencv[python,${PYTHON_USEDEP}]
	>=dev-python/shapely-2.0.0[${PYTHON_USEDEP}]
	>=sci-ml/pytorch-1.10.2
	interaction? ( dev-python/lanelet2[${PYTHON_USEDEP}] )
	lyft? ( dev-python/l5kit[${PYTHON_USEDEP}] )
	nusc? ( dev-python/nuscenes-devkit[${PYTHON_USEDEP}] )
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
