# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit multilib eutils git-2

DESCRIPTION="Lua Rings Library"
HOMEPAGE="https://github.com/keplerproject/rings"
SRC_URI=""

#s/msva/keplerproject/ when they apply pull-request
EGIT_REPO_URI="git://github.com/msva/rings.git https://github.com/msva/rings.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="luajit"

RDEPEND=" || ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	luajit? ( dev-lang/luajit:2 )"
DEPEND="${RDEPEND}"

src_configure() {
	LUA="lua";
	use luajit && LUA="luajit"
	cd "${S}"
	./configure "${LUA}"
}

src_compile() {
	use luajit && INC="-I/usr/include/luajit-2.0/"
	emake DESTDIR="${D}" CC="$(tc-getCC) -fPIC -DPIC" LDFLAGS="${LDFLAGS}" INC="${INC}" CFLAGS="${CFLAGS}" || die "Can't copmile Rings library"
}
