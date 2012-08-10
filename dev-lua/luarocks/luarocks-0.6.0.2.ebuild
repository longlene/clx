# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A system that allows the versioning of Lua packages and their dependencies."
HOMEPAGE="http://luaforge.net/projects/luarocks/"
SRC_URI="http://luaforge.net/frs/download.php/3516/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"
RDEPEND="${DEPEND}"

src_compile() {
	# Not a standard configure script
	./configure --prefix=/usr || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	keepdir /usr/$(get_libdir)/luarocks
}

pkg_postinst() {
	elog "To be able to use modules installed by luarocks,"
	elog "run lua with -lluarocks.require argument."
	elog "You can set the LUA_INIT environment variable as well."
}

