# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="PL/Lua is an implementation of Lua as a loadable procedural language for PostgreSQL"
HOMEPAGE="https://github.com/pllua/pllua"
SRC_URI=""

EGIT_REPO_URI="https://github.com/pllua/pllua.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="luajit"

DEPEND="
	dev-db/postgresql
	!luajit? ( dev-lang/lua )
	luajit? ( dev-lang/luajit )
"
RDEPEND="${DEPEND}"

src_compile() {
	local mylualibs
	if use luajit ; then
		mylualibs=$(pkg-config --libs luajit)
	else
		mylualibs=$(pkg-config --libs lua)
	fi
	emake LUALIB=${mylualibs}
}
