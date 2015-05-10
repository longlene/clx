# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="An object relational mapper for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/integral"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/integral.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-annot
dev-lisp/sxql
dev-lisp/dbi
dev-lisp/cl-ppcre
dev-lisp/closer-mop
dev-lisp/clos-fixtures
dev-lisp/split-sequence
dev-lisp/group-by
dev-lisp/iterate
dev-lisp/alexandria
dev-lisp/trivial-types
"

src_install() {
	common-lisp-install-sources src
	common-lisp-install-sources -t all README.markdown
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf ${PN}-test.asd
	fi
}
