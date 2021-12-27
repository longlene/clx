# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="AWS SDK for OpenResty"
HOMEPAGE="https://github.com/Kong/lua-resty-aws"
SRC_URI="https://github.com/Kong/lua-resty-aws/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r src/resty
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
