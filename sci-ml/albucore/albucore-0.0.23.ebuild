# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="High-Performance Image Processing Functions"
HOMEPAGE="
	https://albumentations.ai/
"
SRC_URI="https://github.com/albumentations-team/albucore/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/numpy-1.24.4[${PYTHON_USEDEP}]
	>=dev-libs/stringzilla-3.10.4[python,${PYTHON_USEDEP}]
	>=dev-python/simsimd-5.9.2[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
