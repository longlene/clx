# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

EGIT_COMMIT="617836ce3551927ec94e2024b18d6c899226a742"

DESCRIPTION="Official APIs for the MS-COCO dataset"
HOMEPAGE="
	https://pypi.org/project/pycocotools/
	https://github.com/ppwwyyxx/cocoapi
"
SRC_URI="https://github.com/ppwwyyxx/cocoapi/archive/${EGIT_COMMIT}.tar.gz -> cocoapi-${EGIT_COMMIT}.gh.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/matplotlib-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-0.27.3[${PYTHON_USEDEP}]
"

RESTRICT="test"

S="${WORKDIR}"/cocoapi-${EGIT_COMMIT}/PythonAPI
