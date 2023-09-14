# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Common Lisp ClickHouse Client Library"
HOMEPAGE="https://github.com/juliojimenez/clickhouse-cl"
SRC_URI="https://github.com/juliojimenez/clickhouse-cl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/boost-json
	dev-lisp/dexador
	dev-lisp/lexer
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	rm -rf clickhouse-test.asd t
}
