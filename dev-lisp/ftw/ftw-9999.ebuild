# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Functional HTTP Request Dispatcher"
HOMEPAGE="https://github.com/drewc/ftw"
SRC_URI=""

EGIT_REPO_URI="https://github.com/drewc/ftw.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/arnesi
	dev-lisp/yaclml
	dev-lisp/cl-utilities
	dev-lisp/ucw
	dev-lisp/sexp-style
	dev-lisp/contextl
	dev-lisp/hunchentoot
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/rucksack
	dev-lisp/lisp-on-lines
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-demo.asd demo
}
