# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dae42129afbf0b786da1a48c9a1279e6779e43a5"

DESCRIPTION="MOP-Based in-memory database with transactions for Common Lisp"
HOMEPAGE="http://bknr.net/"
SRC_URI="https://github.com/hanshuebner/bknr-datastore/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-interpol
	dev-lisp/unit-test
	dev-lisp/cl-interpol
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/yason
	dev-lisp/trivial-utf8
	dev-lisp/cxml
	dev-lisp/cl-ppcre
	dev-lisp/md5
	dev-lisp/flexi-streams
	dev-lisp/bordeaux-threads
"
BDEPEND=""
