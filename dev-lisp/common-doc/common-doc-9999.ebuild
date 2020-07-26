# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="A framework for representing and manipulating documents"
HOMEPAGE="http://commondoc.github.io"
SRC_URI=""

EGIT_REPO_URI="https://github.com/CommonDoc/common-doc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-types
	dev-lisp/quri
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/closer-mop
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
