# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Anomaly Detection Library"
HOMEPAGE="https://github.com/openvinotoolkit/anomalib"
SRC_URI="https://github.com/openvinotoolkit/anomalib/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	sci-ml/lightning-utilities[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/omegaconf-2.1.1[${PYTHON_USEDEP}]
		>=dev-python/rich-13.5.2[${PYTHON_USEDEP}]
		>=dev-python/jsonargparse-4.27.7[${PYTHON_USEDEP}]
		dev-python/docstring-parser[${PYTHON_USEDEP}]
		dev-python/rich-argparse[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"
