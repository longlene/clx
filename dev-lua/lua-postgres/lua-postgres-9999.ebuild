# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-2

DESCRIPTION="A basic Postgres driver for Lua"
HOMEPAGE="https://github.com/norman/lua-postgres"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/norman/lua-postgres.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"

src_install() {
	local sharedir=$(get_lua_sharedir)
	insinto ${sharedir}/postgres
	doins src/postgres/ext src/postgres.lua

	local libdir=$(get_lua_libdir)
	insinto ${libdir}/postgres
	doins postgres/core.so

	dodoc README.md
}
