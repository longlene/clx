# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Making AI for Robotics more accessible with end-to-end learning"
HOMEPAGE="https://github.com/huggingface/lerobot"
SRC_URI="https://github.com/huggingface/lerobot/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/pytorch-2.7.0
	>=sci-ml/torchvision-0.22.0
	>=sci-ml/huggingface_hub-1.6.0
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
	>=media-libs/opencv-4.9.0[python,${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	>=dev-python/einops-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/draccus-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	>=sci-ml/gymnasium-1.1.1[${PYTHON_USEDEP}]
	>=sci-ml/safetensors-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/termcolor-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-71.0.0[${PYTHON_USEDEP}]
	>=dev-build/cmake-3.29.0.1
"

RESTRICT="test"
