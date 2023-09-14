# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e0785af29b25fb5983cfa92df64c2a552579f441"

DESCRIPTION="SPARQL query builder for Common Lisp"
HOMEPAGE="https://github.com/mmontone/cl-sparql"
SRC_URI="https://github.com/mmontone/cl-sparql/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/puri
	dev-lisp/parser-combinators
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-tests.asd test.lisp
}
