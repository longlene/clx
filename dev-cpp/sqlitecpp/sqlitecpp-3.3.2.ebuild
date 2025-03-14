# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="SQLiteC++ (SQLiteCpp) is a smart and easy to use C++ SQLite3 wrapper"
HOMEPAGE="https://github.com/SRombauts/SQLiteCpp"
SRC_URI="https://github.com/SRombauts/SQLiteCpp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example +system-sqlite test"

DEPEND="
	system-sqlite? ( dev-db/sqlite )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSQLITECPP_BUILD_TESTS=$(usex test)
		-DSQLITECPP_INTERNAL_SQLITE=$(usex !system-sqlite)
		-DSQLITECPP_RUN_CPPLINT=OFF
		-DSQLITECPP_RUN_CPPCHECK=OFF
		-DSQLITECPP_BUILD_EXAMPLES=$(usex example)
	)
	cmake_src_configure
}

