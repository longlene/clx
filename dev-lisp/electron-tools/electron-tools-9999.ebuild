# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Tools for working with Electron"
HOMEPAGE="https://github.com/ceramic/electron-tools"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ceramic/electron-tools.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-download
	dev-lisp/trivial-extract
	dev-lisp/osicat
	dev-lisp/trivial-exe
	dev-lisp/uiop
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
