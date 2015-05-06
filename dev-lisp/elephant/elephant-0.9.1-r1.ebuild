# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit common-lisp-2 eutils

DESCRIPTION="Elephant is an object database for Common Lisp"
HOMEPAGE="http://common-lisp.net/project/elephant/"
SRC_URI="http://common-lisp.net/~sionescu/files/${P}.tar.bz2
		doc? ( http://www.common-lisp.net/project/${PN}/doc/${PN}.pdf )"

LICENSE="GPL-2 LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="doc postgres sqlite3"

RDEPEND="!dev-lisp/cl-${PN}
		sys-libs/db:4.8
		dev-lisp/uffi
		dev-lisp/clsql
		dev-lisp/cl-base64
		dev-lisp/fiveam
		postgres? ( dev-lisp/clsql[postgres] )
		sqlite3? ( dev-lisp/clsql[sqlite3] )"

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}"/${PV}-config.sexp.patch
	epatch "${FILESDIR}"/${PV}-fix-tests.patch
	mv "${S}"/config.sexp "${S}"/my-config.sexp
}

src_install() {
	common-lisp-install {${PN},${PN}-tests,ele-bdb,ele-clsql}.asd \
		tests src/{db-bdb,db-clsql,elephant,memutil,query,utils} my-config.sexp
	common-lisp-symlink-asdf ${PN} ${PN}-tests ele-bdb ele-clsql
	if use postgres ; then
		common-lisp-install ele-postgresql.asd
		common-lisp-symlink-asdf ele-postgresql
	fi
	if use sqlite3 ; then
		common-lisp-install ele-sqlite3.asd
		common-lisp-symlink-asdf ele-sqlite3
	fi

	dodoc CREDITS README
	dohtml doc/html/*
	use doc && dodoc "${DISTDIR}"/${PN}.pdf
	docinto examples && dodoc examples/*
}
