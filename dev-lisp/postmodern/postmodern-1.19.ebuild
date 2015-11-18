# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit common-lisp-3 eutils

DESCRIPTION="A Common Lisp library for interacting with PostgreSQL databases."
HOMEPAGE="http://marijnhaverbeke.nl/postmodern/"
SRC_URI="http://marijnhaverbeke.nl/${PN}/${P}.tgz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="dev-lisp/md5
		dev-lisp/usocket
		dev-lisp/ieee-floats
		dev-lisp/trivial-utf8
		dev-lisp/closer-mop
		dev-lisp/bordeaux-threads
		dev-lisp/fiveam"

CLSYSTEMS="cl-postgres postmodern simple-date s-sql"

src_install() {
	common-lisp-install-sources ${CLSYSTEMS}
	common-lisp-install-asdf
	dohtml doc/*
}
