# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution"
HOMEPAGE="
	https://www.jaided.ai/
	https://pypi.org/project/easyocr/
"
SRC_URI="https://github.com/JaidedAI/EasyOCR/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sci-libs/pytorch[${PYTHON_SINGLE_USEDEP}]
	>=sci-libs/torchvision-0.5[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/scikit-image[${PYTHON_USEDEP}]
		dev-python/python-bidi[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/shapely[${PYTHON_USEDEP}]
		dev-python/pyclipper[${PYTHON_USEDEP}]
		dev-python/ninja[${PYTHON_USEDEP}]
		media-libs/opencv[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"
#
#distutils_enable_tests pytest
RESTRICT="test"

S="${WORKDIR}"/EasyOCR-${PV}
