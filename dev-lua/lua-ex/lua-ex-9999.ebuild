# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cvs lua

DESCRIPTION="The Lua Extension API"
HOMEPAGE="http://luaforge.net/projects/lua-ex/"
ECVS_SERVER="cvs.luaforge.net:/cvsroot/lua-ex"
ECVS_MODULE="${PN}"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	cvs_src_unpack
	cd "${S}"

	sed -e "s:^\(LUA= \).*:\1$(lua_get_libdir):" \
		-e ":^LUAINC=:d" \
		-e "s:^\(LUALIB= \).*:\1 -llua:" \
		-e ":^POSIX_SPAWN:,:^EXTRA:d" \
		conf.in > conf || die "sed in conf.in failed"

	# Respect CFLAGS and add -fPIC.
	sed -i \
		-e "s:^CFLAGS=:CFLAGS+= -fPIC :" \
		posix/Makefile || die "sed in posix/Makefile failed"
}

src_compile() {
	emake linux || die "emake failed"
}

src_install() {
	lua_install_cmodule posix/ex.so
	dodoc Changelog README || die "dodoc failed"
}

