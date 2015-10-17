# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Lack, the core of Clack"
HOMEPAGE="https://github.com/fukamachi/lack"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/lack.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/ironclad
dev-lisp/alexandria

dev-lisp/local-time

dev-lisp/cl-base64
dev-lisp/split-sequence

dev-lisp/cl-ppcre

dev-lisp/trivial-mimes
dev-lisp/uiop
dev-lisp/alexandria

dev-lisp/quri
dev-lisp/http-body

dev-lisp/dbi
dev-lisp/marshal
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
