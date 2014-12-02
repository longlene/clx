# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit multilib lua

DESCRIPTION="OpenGL binding for Lua"
HOMEPAGE="http://luagl.sourceforge.net/"
SRC_URI="mirror://sourceforge/projects/${PN}/files/${PV}/Docs%20and%20Sources/${P}_Sources.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
virtual/glu"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}

src_compile() {
	local luaver=$(lua -v 2>&1 | cut -d ' ' -f 2 | cut -d . -f1,2 | tr -d .)
	local cmd="make --no-print-directory -f ../tecmake.mak"
	cd ${S}/src
	${cmd} MF=luagl_base USE_LUA${luaver}=Yes
	${cmd} MF=luagl USE_LUA${luaver}=Yes
	${cmd} MF=luaglu USE_LUA${luaver}=Yes
}

src_install() {
	lua_install_cmodule lib/*/*.so
	use static-libs && dolib lib/*/*.a
	insinto /usr/include/luagl
	doins include/*.h
}
