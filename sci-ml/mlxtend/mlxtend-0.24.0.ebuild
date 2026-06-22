# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Machine Learning Library Extensions for Python"
HOMEPAGE="https://rasbt.github.io/mlxtend/ https://github.com/rasbt/mlxtend"
SRC_URI="https://github.com/rasbt/mlxtend/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/scipy-1.16.3[${PYTHON_USEDEP}]
		>=dev-python/numpy-2.3.5[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
		>=dev-python/scikit-learn-1.8.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.10.8[${PYTHON_USEDEP}]
		>=dev-python/joblib-1.5.2[${PYTHON_USEDEP}]
	')
"
