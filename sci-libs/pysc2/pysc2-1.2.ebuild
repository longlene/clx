# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="StarCraft II Learning Environment"
HOMEPAGE="https://github.com/deepmind/pysc2"
SRC_URI="https://github.com/deepmind/pysc2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/mpyq
	dev-python/six
	dev-python/absl-py
	dev-python/numpy
	dev-python/portpicker
	dev-python/protobuf
	dev-python/pygame
	dev-python/s2client-proto
	dev-python/websocket-client
"
