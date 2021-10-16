# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="SQLite ORM light header only library for modern C++"
HOMEPAGE="https://github.com/fnc12/sqlite_orm"
SRC_URI="https://github.com/fnc12/sqlite_orm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/sqlite
"

src_prepare() {
	default
	sed -i '/add_subdirectory/{/examples/d}' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DSqliteOrm_BuildTests=OFF
	)
	cmake_src_configure
}
