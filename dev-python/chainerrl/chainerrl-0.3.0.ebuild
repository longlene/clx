# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="ChainerRL is a deep reinforcement learning library built on top of Chainer"
HOMEPAGE="https://github.com/chainer/chainerrl"
SRC_URI="https://github.com/chainer/chainerrl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/cached-property
	dev-python/chainer
	dev-python/fastcache
	dev-python/funcsigs
	dev-python/gym
	dev-python/numpy
	dev-python/pillow
	dev-python/scipy
	dev-python/statistics
"
