# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C Database abstraction library with json based language"
HOMEPAGE="https://github.com/babelouest/hoel"
SRC_URI="https://github.com/babelouest/hoel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sqlite mariadb postgres"

DEPEND="
	dev-libs/jansson
	dev-libs/orcania
	sqlite? ( dev-db/sqlite )
	mariadb? ( dev-db/mariadb )
	postgres? ( dev-db/postgresql )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
	-DWITH_SQLITE3=$(usex sqlite)
	-DWITH_MARIADB=$(usex mariadb)
	-DWITH_PGSQL=$(usex postgres)
	)
	cmake_src_configure
}

