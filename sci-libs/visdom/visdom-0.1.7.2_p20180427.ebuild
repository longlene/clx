# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_4 )
inherit distutils-r1 lua vcs-snapshot

EGIT_COMMIT="8a3a6a4a8928693a240cf16efa6106f2a01a5827"

DESCRIPTION="A flexible tool for creating, organizing, and sharing visualizations of live, rich data"
HOMEPAGE="https://github.com/facebookresearch/visdom"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/facebookresearch/visdom/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="lua"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/numpy-1.8
	dev-python/pillow
	dev-python/pyglet
	dev-python/pyzmq
	dev-python/requests
	dev-python/six
	dev-python/tornado
	dev-python/torchfile
	dev-python/websocket-client
	sci-libs/scipy
	lua? (
		sci-libs/torch7
		dev-lua/argcheck
		dev-lua/luafilesystem
		sci-libs/torchnet
		sci-libs/torch-image
		dev-lua/luasocket
		dev-lua/lua-cjson
		dev-lua/luaffi
		dev-lua/torch-paths
	)
"

src_install() {
	distutils-r1_src_install
	if use lua ; then
		insinto $(lua_get_sharedir)/visdom
		doins th/init.lua
	fi
}

