# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit lua toolchain-funcs

MY_PN="lua_signal"

DESCRIPTION="A signal library for Lua 5.1."
HOMEPAGE="http://luaforge.net/projects/luasignal/"
SRC_URI="http://luaforge.net/frs/download.php/2988/${MY_PN}v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="=dev-lang/lua-5.1*"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	$(tc-getCC) -fPIC -shared ${CFLAGS} ${LDFLAGS} lsignal.c -o signal.so ||\
		die "failed to compile luasignal"
}

src_install() {
	lua_install_cmodule signal.so
	dodoc readme.txt || die "dodoc failed"
}

