# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="5"

inherit base git-r3 toolchain-funcs

DESCRIPTION="Lua driver for MongoDB"
HOMEPAGE="https://github.com/mwild1/luamongo/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mwild1/luamongo git://github.com/mwild1/luamongo"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="luajit"

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	dev-libs/boost
	dev-db/mongodb[sharedclient]
"
DEPEND="${RDEPEND}"

DOCS=( "README.md" )

src_compile() {
	local lua=lua;
	use luajit && lua=luajit;
	emake LUA_INC="-I$($(tc-getPKG_CONFIG) --variable includedir ${lua})"
}

src_install() {
	local lua=lua;
	use luajit && lua=luajit;
	insinto "$($(tc-getPKG_CONFIG) --variable INSTALL_CMOD ${lua})"
	doins "mongo.so"
	base_src_install_docs
}