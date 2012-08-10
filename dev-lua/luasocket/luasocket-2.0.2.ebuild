# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/luafilesystem/luafilesystem-1.4.1.ebuild,v 1.2 2008/08/08 22:50:43 matsuu Exp $

inherit multilib toolchain-funcs

DESCRIPTION="Network support for the Lua language "
HOMEPAGE="http://www.tecgraf.puc-rio.br/~diego/professional/luasocket/"
SRC_URI="http://luaforge.net/frs/download.php/2664/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/lua-5.1"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e "s|/usr/local|${D}/usr|" \
		-e "s|/lib|/$(get_libdir)|" \
		-e "s|-O2|${CFLAGS}|" \
		-e "s|gcc|$(tc-getCC)|" \
		config || die "sed failed"
}

src_install() {
	emake install || die "emake failed"
	dodoc README NEW || die "dodoc failed"
	dohtml doc/* || die "dohtml failed"
}
