# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Javascript parser written in common lisp"
HOMEPAGE="https://github.com/gonzojive/js-parser"
SRC_URI=""
EGIT_REPO_URI="https://github.com/gonzojive/js-parser.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="+test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
"

src_install() {
	common-lisp-install-sources src external
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources tests
		common-lisp-install-asdf ${PN}-tests.asd
	fi
}
