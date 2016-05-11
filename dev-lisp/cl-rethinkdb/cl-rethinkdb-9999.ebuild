# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="RethinkDB driver for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/cl-rethinkdb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/orthecreedence/cl-rethinkdb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/blackbird
	dev-lisp/vom
	dev-lisp/local-time
	dev-lisp/event-glue
	dev-lisp/cl-async
	dev-lisp/fast-io
	dev-lisp/jonathan
	dev-lisp/cl-base64
	dev-lisp/cl-hash-util
	dev-lisp/cl-ppcre
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd test
}
