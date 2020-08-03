# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib lua

DESCRIPTION="A SAX XML parser based on the Expat library."
HOMEPAGE="http://www.keplerproject.org/luaexpat/"
SRC_URI="http://luaforge.net/frs/download.php/2469/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/lua
	>=dev-libs/expat-2.0.0"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P%.*}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	lua_version

	sed -i \
		-e "s:/usr/local/lib:\"${D}\"/usr/$(get_libdir):" \
		-e "s:/usr/local/share:\"${D}\"/usr/share:" \
		-e "s:usr/local:usr:" \
		-e "s:\(LUA_VERSION_NUM=\).*:\1 ${LUAVER}0:" \
		-e "s:5.0:${LUAVER}:" \
		-e "s:-O2:-fPIC ${CFLAGS}:" \
		config || die "sed in config failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake install || die "emake install failed"
}
