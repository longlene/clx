# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ac7473b776cfaf37b6665292e27b69f421087927"

DESCRIPTION="Common Lisp CFFI wrapper around the DuckDB C API"
HOMEPAGE="https://github.com/ak-coram/cl-duckdb"
SRC_URI="https://github.com/ak-coram/cl-duckdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/cl-ascii-table
	dev-lisp/cl-spark
	dev-lisp/local-time
	dev-lisp/local-time-duration
	dev-lisp/periods
	dev-lisp/str
	dev-lisp/serapeum
	dev-lisp/uuid
	dev-db/duckdb
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:duckdb\/test,$d' \
		-i duckdb.asd
	rm duckdb-test.lisp duckdb-benchmark.lisp
}
