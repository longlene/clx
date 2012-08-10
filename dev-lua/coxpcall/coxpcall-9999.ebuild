# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit multilib eutils git-2

DESCRIPTION="Lua coxpcall Library"
HOMEPAGE="https://github.com/keplerproject/coxpcall"
SRC_URI=""

#s/msva/keplerproject/ when they apply pull-request
EGIT_REPO_URI="git://github.com/msva/coxpcall.git https://github.com/msva/coxpcall.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="doc"

RDEPEND=" || ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )"
DEPEND="${RDEPEND}"

src_configure() {
	LUA="lua";
	./configure "${LUA}"
}

src_install() {
	emake DESTDIR="${D}" install
	use doc && emake DESTDIR="${D}" install-doc
}
