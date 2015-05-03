# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Procedural vector parser"
HOMEPAGE="https://github.com/fukamachi/proc-parse"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/proc-parse.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/babel
"

src_install() {
	common-lisp-install-sources -t all src README.markdown
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf ${PN}-test.asd
	fi
}
