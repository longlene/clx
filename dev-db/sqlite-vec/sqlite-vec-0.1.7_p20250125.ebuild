# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="a2dd24f27ec7e4a5743e58f5ab6835deea5db58d"
SQLITE_VER="3450300"

DESCRIPTION="A vector search SQLite extension that runs anywhere"
HOMEPAGE="https://github.com/asg017/sqlite-vec"
SRC_URI="
	https://github.com/asg017/sqlite-vec/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://www.sqlite.org/2024/sqlite-amalgamation-${SQLITE_VER}.zip
"

LICENSE="|| ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	ln -sv "${WORKDIR}"/sqlite-amalgamation-${SQLITE_VER} vendor
}

src_compile() {
	emake all
}

src_install() {
	doheader sqlite-vec.h
	dolib.a dist/libsqlite_vec0.a
	dolib.so dist/vec0.so
	einstalldocs
}
