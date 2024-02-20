# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_1{1..2} )

inherit distutils-r1

DESCRIPTION="Remote Python Call (RPyC) is a transparent and symmetric distributed computing library"
HOMEPAGE="https://github.com/tomerfiliba-org/rpyc"
SRC_URI="https://github.com/tomerfiliba-org/rpyc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/plumbum[${PYTHON_USEDEP}]
"
BDEPEND=""

RESTRICT="test"
