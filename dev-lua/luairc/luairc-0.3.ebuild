# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit lua

MY_P="LuaIRC-${PV}"

DESCRIPTION="A fully featured IRC framework written entirely in Lua."
HOMEPAGE="http://luaforge.net/projects/luairc/"
SRC_URI="http://luaforge.net/frs/download.php/2606/${MY_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default

	sed -i \
		-e "s:\(LUA_DIR = \).*:\1${D}/$(lua_get_sharedir):" \
		Make.config || die "sed in Make.config failed"
}

src_install() {
	emake install || die "emake failed"

	dodoc README TODO || die "dodoc failed"
	if use doc; then
		dohtml -r doc/* || die "dohtml failed"
	fi

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins test/* || die "doins failed"
	fi
}
