# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit lua

DESCRIPTION="Lua binding for PostgreSQL"
HOMEPAGE="https://github.com/arcapos/luapgsql"
SRC_URI="https://github.com/arcapos/luapgsql/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/-lbsd//' GNUmakefile
}

src_compile() {
	emake -f GNUmakefile || dile "compile failed"
}

src_install() {
	lua_install_cmodule pgsql.so
	dodoc README luapgsql.pdf
}
