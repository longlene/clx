# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="A set of easy-to-use utils that will come in handy in any Computer Vision"
HOMEPAGE="https://github.com/roboflow/supervision https://supervision.roboflow.com"
SRC_URI="https://github.com/roboflow/supervision/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="metrics"
RESTRICT="test"

# dev-python/pydeprecate is not yet packaged in portage.

RDEPEND="
	media-libs/opencv[python,${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.6[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.21.2[${PYTHON_USEDEP}]
		>=dev-python/pillow-9.4[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
		>=dev-python/requests-2.26[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.10[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.62.3[${PYTHON_USEDEP}]
		metrics? ( >=dev-python/pandas-2[${PYTHON_USEDEP}] )
	')
"
