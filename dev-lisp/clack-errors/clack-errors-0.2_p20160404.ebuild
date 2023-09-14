# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6ae28fefe91373b5a667801247021fd3ace31ba2"

DESCRIPTION="Error page middleware for Clack"
HOMEPAGE="https://github.com/eudoxia0/clack-errors"
SRC_URI="https://github.com/eudoxia0/clack-errors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/closer-mop
	dev-lisp/local-time
	dev-lisp/trivial-backtrace
	dev-lisp/djula
	dev-lisp/cl-ppcre
	example? ( dev-lisp/cl-markup )
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
	use example || rm -r ${PN}-demo.asd demo
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md static templates
}
