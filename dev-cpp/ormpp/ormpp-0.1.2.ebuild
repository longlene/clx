# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Modern C++17 ORM supporting MySQL, PostgreSQL, SQLite and MariaDB"
HOMEPAGE="https://github.com/qicosmos/ormpp"
SRC_URI="https://github.com/qicosmos/ormpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mysql mariadb postgres sqlite"

RDEPEND="
	mysql? ( virtual/mysql )
	mariadb? ( dev-db/mariadb-connector-c )
	postgres? ( dev-db/postgresql:= )
	sqlite? ( dev-db/sqlite:3 )
"

src_configure() { :; }
src_compile() { :; }

src_install() {
	insinto /usr/include
	doins -r ormpp iguana frozen
	dodoc README.md
}
