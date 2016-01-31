# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="Lua bindings for OpenSSL libcrypto"
HOMEPAGE="http://luacrypto.luaforge.net/"
SRC_URI="mirror://github/luaforge/luacrypto/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
|| ( dev-libs/openssl dev-libs/libgcrypt )
"

src_prepare() {
	local luaver="$(lua -v 2>&1| cut -d' ' -f2)"
	local ver="${luaver%.*}"
	sed -e "s:/usr/local/lib:/usr/$(get_libdir):" \
		-e 's:/usr/local:/usr:' \
		-e "/LUA_LIBDIR/ s:5.0:${ver}:" \
		-e "s:500:${luaver//./}:" \
		-i config
}

src_install() {
	local lualibdir="$(lua_get_libdir)"
	lua_install_cmodule src/lcrypto.so.${PV}
	#dosym ${lualibdir}/lcrypto.so.${PV} ${lualibdir}/lcrypto.so
	dosym lcrypto.so.${PV} ${lualibdir}/lcrypto.so
	dodoc README
}
