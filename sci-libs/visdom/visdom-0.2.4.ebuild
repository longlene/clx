# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1 lua vcs-snapshot

DESCRIPTION="Creating, organizing & sharing visualizations of live, rich data"
HOMEPAGE="https://github.com/facebookresearch/visdom"
SRC_URI="https://github.com/fossasia/visdom/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="lua"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/numpy-1.8[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pyglet[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/tornado[${PYTHON_USEDEP}]
	dev-python/torchfile[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
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

