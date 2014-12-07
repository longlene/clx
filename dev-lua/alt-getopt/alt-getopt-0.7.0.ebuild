# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit base toolchain-funcs

DESCRIPTION="Lua bindings to getopt_long"
HOMEPAGE="http://luaforge.net/projects/alt-getopt"
SRC_URI="mirror://luaforge/${PN}/${PN}/${PN}-${PV}/lua-${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="luajit"

RDEPEND="
	!luajit? ( >=dev-lang/lua-5.1 )
	luajit?  ( dev-lang/luajit:2 )
"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig
"

DOCS=( "README" )

S="${WORKDIR}/lua-${P}"

src_compile() {
	:
}

src_install() {
	local lua=lua;
	use luajit && lua=luajit;

	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_LMOD ${lua})"
	doins alt_getopt.lua

	dobin alt_getopt

	base_src_install_docs
}