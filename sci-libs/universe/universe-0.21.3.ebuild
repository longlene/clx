# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1

DESCRIPTION="Universe: a software platform for measuring and training an AI's general intelligence across the world's supply of games, websites and other applications"
HOMEPAGE="https://universe.openai.com"
SRC_URI="https://github.com/openai/universe/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/autobahn
	dev-python/docker-py
	dev-python/docker-pycreds
	dev-python/fastzbarlight
	dev-python/go-vncdriver
	sci-libs/gym
	dev-python/pillow
	dev-python/pyyaml
	dev-python/six
	dev-python/twisted
	dev-python/ujson
"
