# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="experimental language for type inference"
HOMEPAGE="https://github.com/moratori/protolang"
SRC_URI=""

EGIT_REPO_URI="https://github.com/moratori/protolang.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-lex
dev-lisp/cl-yacc
dev-lisp/cl-annot
"

src_install() {
	common-lisp-install-sources src
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources test
		common-lisp-install-asdf ${PN}-test.asd
	fi
	dodoc README.md
}
