# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib lua

DESCRIPTION="OpenGL binding for Lua"
HOMEPAGE="http://luagl.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/${PV}/Docs%20and%20Sources/${P}_Sources.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk iup cd im static-libs"

RDEPEND="
	|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	virtual/glu
	iup? ( dev-libs/iup )
	cd? ( media-libs/cd )
	im? ( media-libs/im )
"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_compile() {
	local args=""
	use iup && args+=" USE_IUP=Yes "
	use cd && args+=" USE_CD=Yes "
	use im && args+=" USE_IM=Yes "

	local luaver=$(lua -v 2>&1 | cut -d ' ' -f 2 | cut -d . -f1,2 | tr -d .)
	local cmd="make --no-print-directory -f ../tecmake.mak"
	cd ${S}/src
	${cmd} MF=luagl_base USE_LUA${luaver}=Yes $args
	${cmd} MF=luagl USE_LUA${luaver}=Yes $args
	${cmd} MF=luaglu USE_LUA${luaver}=Yes $args
}

src_install() {
	lua_install_cmodule lib/Linux*/Lua*/*.so
	use static-libs && dolib lib/Linux*/Lua*/*.a
	insinto /usr/include/luagl
	doins include/*.h
}
