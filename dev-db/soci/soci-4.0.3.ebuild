# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The C++ Database Access Library"
HOMEPAGE="http://soci.sourceforge.net/"
SRC_URI="https://github.com/SOCI/soci/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="firebird mysql odbc postgres"

DEPEND="
	dev-libs/boost
	dev-db/sqlite:3
	firebird? ( dev-db/firebird )
	mysql? ( dev-db/mysql )
	odbc? ( dev-db/unixODBC )
	postgres? ( dev-db/postgresql )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSOCI_TESTS=OFF
		-DWITH_DB2=OFF
		-DWITH_FIREBIRD=$(usex firebird)
		-DWITH_MYSQL=$(usex mysql)
		-DWITH_ODBC=$(usex odbc)
		-DWITH_ORACLE=OFF
		-DWITH_POSTGRESQL=$(usex postgres)
		-DWITH_SQLITE3=ON
	)
	cmake_src_configure
}
