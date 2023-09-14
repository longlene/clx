# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua

DESCRIPTION="A Lua client library for the redis key value storage system"
HOMEPAGE="https://github.com/nrk/redis-lua"
SRC_URI="https://github.com/nrk/redis-lua/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
"

src_install() {
	lua_install_module src/redis.lua
	dodoc README.markdown
}
