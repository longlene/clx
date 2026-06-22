# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

SQLITE_VER="3450300"

DESCRIPTION="A vector search SQLite extension that runs anywhere"
HOMEPAGE="https://github.com/asg017/sqlite-vec"
SRC_URI="
	https://github.com/asg017/sqlite-vec/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://www.sqlite.org/2024/sqlite-amalgamation-${SQLITE_VER}.zip
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	ln -sv "${WORKDIR}"/sqlite-amalgamation-${SQLITE_VER} vendor
}

src_compile() {
	emake loadable static
}

src_install() {
	doheader sqlite-vec.h
	dolib.a dist/libsqlite_vec0.a
	dolib.so dist/vec0.so
	einstalldocs
}
