# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="A toolkit for developing and comparing reinforcement learning algorithms"
HOMEPAGE="https://github.com/openai/gym"
SRC_URI="https://github.com/openai/gym/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/numpy
	dev-python/requests
	dev-python/six
	dev-python/pyglet
	sci-libs/scipy
"
