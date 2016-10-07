# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Pattern Matcher Compatible with Optima"
HOMEPAGE="https://github.com/guicho271828/trivia"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/trivia.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lisp-namespaces
	dev-lisp/closer-mop
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf test *.test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
