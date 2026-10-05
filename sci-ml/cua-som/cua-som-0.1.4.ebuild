# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 pypi

DESCRIPTION="Computer vision and OCR library for detecting and analyzing UI elements"
HOMEPAGE="
	https://github.com/trycua/cua
	https://pypi.org/project/cua-som/
"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/huggingface_hub-0.21.4[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.2.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/torchvision-0.17.1[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/ultralytics-8.1.28[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/matplotlib-3.8.3[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.2.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.6.3[${PYTHON_USEDEP}]
		>=dev-python/setuptools-75.8.1[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
		>=media-libs/opencv-4.11.0[python,${PYTHON_USEDEP}]
		>=sci-ml/easyocr-1.7.1[${PYTHON_USEDEP}]
		>=sci-ml/supervision-0.25.1[${PYTHON_USEDEP}]
	')
"

EPYTEST_PLUGINS=()

distutils_enable_tests pytest
