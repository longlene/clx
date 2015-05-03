# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="HTTP cookie manager"
HOMEPAGE="https://github.com/fukamachi/cl-cookie"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fukamachi/cl-cookie.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/proc-parse
dev-lisp/cl-ppcre
dev-lisp/quri
dev-lisp/local-time
dev-lisp/alexandria
"

src_install() {
	common-lisp-install-souces -t all src README.markdown
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-souces t
		common-lisp-install-asdf ${PN}-test.asd
	fi
}
