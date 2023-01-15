# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10,11} )
inherit distutils-r1

DESCRIPTION="For something in between a pytorch and a karpathy/micrograd"
HOMEPAGE="https://github.com/geohot/tinygrad"
SRC_URI="https://github.com/geohot/tinygrad/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/networkx[${PYTHON_USEDEP}]
"
BDEPEND="
	test? ( dev-python/pytest )
"

distutils_enable_tests pytest
