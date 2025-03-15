# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Python bindings to Atari games"
HOMEPAGE="https://github.com/openai/atari-py"
SRC_URI="https://github.com/openai/atari-py/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy${PYTHON_USEDEP}]
	dev-python/six${PYTHON_USEDEP}]
"
BDEPEND=""
