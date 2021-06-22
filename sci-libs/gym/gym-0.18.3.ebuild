# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )
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
	sci-libs/scipy
	>=dev-python/numpy-1.10.4
	>=dev-python/pyglet-1.4.0
	dev-python/pillow
	>=dev-python/cloudpickle-1.2.0
"
