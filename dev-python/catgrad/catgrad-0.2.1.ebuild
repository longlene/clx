# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="A categorical deep learning compiler"
HOMEPAGE="https://github.com/statusfailed/catgrad"
SRC_URI="https://github.com/statusfailed/catgrad/archive/refs/tags/pypi-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.23.3[${PYTHON_USEDEP}]
	>=dev-python/open-hypergraphs-0.1.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-pypi-${PV}
