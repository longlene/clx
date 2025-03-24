# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Ultralytics YOLO"
HOMEPAGE="
	https://github.com/ultralytics/ultralytics
"
SRC_URI="https://github.com/ultralytics/ultralytics/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/torchvision-0.9.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/ultralytics-thop-2.0.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=sci-ml/pytorch-1.8.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.23.0[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.3.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.6.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-7.1.2[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.4.1[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.64.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/py-cpuinfo[${PYTHON_USEDEP}]
		>=dev-python/pandas-1.1.4[${PYTHON_USEDEP}]
		>=dev-python/seaborn-0.11.0[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"
