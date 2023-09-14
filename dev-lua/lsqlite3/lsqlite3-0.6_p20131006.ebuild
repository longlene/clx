# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="78d148c21f4105592a0ba429b27886d732579dd4"

DESCRIPTION="LuaSQLite 3 is a thin wrapper around the public domain SQLite3 database engine"
HOMEPAGE="http://luaforge.net/projects/luasqlite/"
SRC_URI="https://github.com/LuaDist/lsqlite3/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/sqlite
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i 's#SHFLAGS=\ -fPIC#SHFLAGS+= -fPIC#' Makefile
}

src_install() {
	lua_install_cmodule lsqlite3.so
	dodoc README
}
