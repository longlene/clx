# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Compress a directory from Common Lisp"
HOMEPAGE="https://github.com/ceramic/trivial-compress"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ceramic/trivial-compress.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/archive
	dev-lisp/uiop
	dev-lisp/which
	dev-lisp/zip
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
