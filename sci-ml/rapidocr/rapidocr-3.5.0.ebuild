# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Awesome OCR Library"
HOMEPAGE="
	https://pypi.org/project/rapidocr/
	https://github.com/RapidAI/RapidOCR
"
SRC_URI="https://github.com/RapidAI/RapidOCR/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pyclipper-1.2.0[${PYTHON_USEDEP}]
	>=media-libs/opencv-4.5.1.48[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.19.5[${PYTHON_USEDEP}]
	>=dev-python/six-1.15.0[${PYTHON_USEDEP}]
	>=dev-python/shapely-1.7.1[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/omegaconf[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/colorlog[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/RapidOCR-${PV}/python

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

export PV="${PV}"
