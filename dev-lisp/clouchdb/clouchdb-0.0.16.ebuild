# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

DESCRIPTION="A Common Lisp library for interacting with ClouchDb Databases"
HOMEPAGE="http://common-lisp.net/project/clouchdb"
SRC_URI="http://common-lisp.net/project/clouchdb/clouchdb_${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/drakma
	dev-lisp/parenscript
	dev-lisp/s-base64
	dev-lisp/flexi-streams
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-examples.asd examples.lisp
	use test || rm -rf ${PN}-tests.asd tests.lisp
}
