# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="An S-expression markup language"
HOMEPAGE="https://github.com/CommonDoc/parenml"
SRC_URI=""

EGIT_REPO_URI="https://github.com/CommonDoc/parenml.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/plump
	dev-lisp/common-doc-plump
	dev-lisp/esrap
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
