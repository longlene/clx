# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

DESCRIPTION="SQLiteC++ (SQLiteCpp) is a smart and easy to use C++ SQLite3 wrapper"
HOMEPAGE="https://github.com/SRombauts/SQLiteCpp"
SRC_URI="https://github.com/SRombauts/SQLiteCpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DSQLITECPP_RUN_CPPLINT=OFF
	-DSQLITECPP_RUN_CPPCHECK=OFF
	-DSQLITECPP_BUILD_EXAMPLES=$(usex example)
	-DSQLITECPP_BUILD_TESTS=$(usex test)
	)
	cmake-utils_src_configure
}

src_install() {
	dolib.a ${BUILD_DIR}/libSQLiteCpp.a
	insinto /usr/
	doins -r include
	insinto /usr/share/cmake/Modules
	doins FindSQLiteCpp.cmake
	einstalldocs
}
