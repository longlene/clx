# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d847a9ecf19f50773bb96d83d9b9f6d813b03872"

DESCRIPTION="Error page middleware for Clack"
HOMEPAGE="https://github.com/eudoxia0/clack-errors"
SRC_URI="https://github.com/eudoxia0/clack-errors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/closer-mop
	dev-lisp/local-time
	dev-lisp/trivial-backtrace
	dev-lisp/djula
	dev-lisp/cl-ppcre
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r demo t ${PN}-{demo,test}.asd
}
