# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

DESCRIPTION="Lua etcd client"
HOMEPAGE="https://github.com/anibali/etcd.lua"
SRC_URI="https://github.com/anibali/etcd.lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
	dev-lua/lua-cjson
"

src_install() {
	lua_install_module etcd.lua
	dodoc README.md
}
