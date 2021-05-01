# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Lua bindings to zziplib"
HOMEPAGE="http://github.com/luaforge/luazip"
EGIT_REPO_URI="git://github.com/luaforge/luazip.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="luajit"

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
		dev-libs/zziplib"
DEPEND="${RDEPEND}
		dev-util/pkgconfig"

src_configure() {
	local LUA_INC="/usr/include"
	use luajit && LUA_INC="/usr/include/luajit-2.0"
	sed -r \
		-e "s#(LUA_INC)=.*#\1=${LUA_INC}#" \
		-e 's#(PREFIX) =.*#\1=$(DESTDIR)/usr#' \
		-e "s#(ZZLIB_INC)=.*#\1=/usr/include#" \
		-e "s#(LUA_VERSION_NUM)=.*#\1=510#" \
		-i config
}
