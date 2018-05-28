# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs

DESCRIPTION="Lua bindings for libmpack"
HOMEPAGE="https://github.com/libmpack/libmpack-lua/"
SRC_URI="https://github.com/libmpack/libmpack-lua/archive/${PV}.tar.gz -> ${PN}-lua-${PV}.tar.gz"
S="${WORKDIR}/libmpack-lua-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="luajit test"

RDEPEND="!luajit? ( >=dev-lang/lua-5.1:= )
	luajit? ( dev-lang/luajit:2= )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-libs/libmpack
	test? ( dev-lua/busted )"

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		USE_SYSTEM_LUA=yes \
		USE_SYSTEM_MPACK=yes \
		LUA_INCLUDE="$($(tc-getPKG_CONFIG) --cflags $(usex luajit 'luajit' 'lua'))" \
		LUA_LIB="$($(tc-getPKG_CONFIG) --libs $(usex luajit 'luajit' 'lua'))"
}

src_test() {
	busted -o gtest test.lua || die
}

src_install() {
	emake \
		DESTDIR="${D}" \
		USE_SYSTEM_LUA=yes \
		LUA_CMOD_INSTALLDIR="$($(tc-getPKG_CONFIG) --variable INSTALL_CMOD $(usex luajit 'luajit' 'lua'))" \
		install
}
