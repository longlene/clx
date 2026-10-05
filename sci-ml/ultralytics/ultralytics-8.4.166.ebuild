# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="YOLO models for object detection, segmentation, pose and classification"
HOMEPAGE="
	https://github.com/ultralytics/ultralytics
	https://pypi.org/project/ultralytics/
"
SRC_URI="https://github.com/ultralytics/ultralytics/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
# tests download model weights and datasets
RESTRICT="test"

RDEPEND="
	>=sci-ml/pytorch-1.8.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.9.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/ultralytics-thop-2.2.0[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/cloudpickle-3.1.1[${PYTHON_USEDEP}]
		>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
		>=dev-python/matplotlib-3.3.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.23.0[${PYTHON_USEDEP}]
		>=dev-python/nvidia-ml-py-12.0.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-7.1.2[${PYTHON_USEDEP}]
		>=dev-python/polars-0.20.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-5.8.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
		>=dev-python/requests-2.23.0[${PYTHON_USEDEP}]
		>=dev-python/ultralytics-platform-0.1.45[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.7.0[python,${PYTHON_USEDEP}]
	')
"
