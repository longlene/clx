# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="797de8f4d9d7963203aba84bbefc3c9128767b9c"

DESCRIPTION="Elephant is an object database for Common Lisp"
HOMEPAGE="http://common-lisp.net/project/elephant/"
SRC_URI="
	https://github.com/gonzojive/elephant/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	doc? ( http://www.common-lisp.net/project/${PN}/doc/${PN}.pdf )"

LICENSE="GPL-2 LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc postgres sqlite3"

RDEPEND="
	sys-libs/db:4.8
	dev-lisp/uffi
	dev-lisp/clsql
	dev-lisp/cl-base64
	dev-lisp/fiveam
	postgres? ( dev-lisp/clsql[postgres] )
	sqlite3? ( dev-lisp/clsql[sqlite3] )
"

src_prepare() {
	eapply_user
	epatch "${FILESDIR}"/${PV}-config.sexp.patch
	epatch "${FILESDIR}"/${PV}-fix-tests.patch
	mv config.sexp my-config.sexp
	if ! use test ; then
		rm -r ${PN}-tests.asd tests
	fi
}

