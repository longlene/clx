# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake

DESCRIPTION="A C++ wrapper for sqlite3 meant to be used in combination with sqlpp11"
HOMEPAGE="https://github.com/rbock/sqlpp11-connector-sqlite3"
SRC_URI="https://github.com/rbock/sqlpp11-connector-sqlite3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/date
	dev-db/sqlite
	dev-cpp/sqlpp11
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/add_subdirectory/{/tests/d}' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DSQLPP11_INCLUDE_DIR=/usr/include
	-DDATE_INCLUDE_DIR=/usr/include
	)
	cmake_src_configure
}
