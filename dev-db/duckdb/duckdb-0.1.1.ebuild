# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="DuckDB is an embeddable SQL OLAP Database Management System"
HOMEPAGE="http://www.duckdb.org"
SRC_URI="https://github.com/cwida/duckdb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include/duckdb
	doins -r src/include/*
	dolib.so ${BUILD_DIR}/src/libduckdb.so
	dodoc README.md
}
