# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Copy a directory"
HOMEPAGE="https://github.com/ceramic/copy-directory"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ceramic/copy-directory.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/cl-fad
	dev-lisp/which
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
