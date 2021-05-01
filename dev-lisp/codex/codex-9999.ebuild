# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A documentation system for Common Lisp"
HOMEPAGE="http://commondoc.github.io/codex/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/CommonDoc/codex.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/docparser
	dev-lisp/common-doc
	dev-lisp/pandocl
	dev-lisp/cl-slug
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/common-html
	dev-lisp/djula
	dev-lisp/trivial-types
	test? (
		dev-lisp/vertex
		dev-lisp/fiveam
	)
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md templates
}
