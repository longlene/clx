# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="A toolkit for developing and comparing reinforcement learning algorithms"
HOMEPAGE="https://github.com/openai/gym"
SRC_URI="https://github.com/openai/gym/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.10.4[${PYTHON_USEDEP}]
	>=dev-python/pyglet-1.4.0[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	>=dev-python/cloudpickle-1.2.0[${PYTHON_USEDEP}]
"

RESTRICT="test"
