# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A small utility library inspired by Python.s string template"
HOMEPAGE="https://github.com/macdavid313/trivial-string-template/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/macdavid313/trivial-string-template.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/proc-parse
	dev-lisp/closer-mop
	dev-lisp/cl-ppcre
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}
