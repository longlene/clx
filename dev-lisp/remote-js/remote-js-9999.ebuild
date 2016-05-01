# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Run JavaScript in a browser from Common Lisp"
HOMEPAGE="https://github.com/ceramic/remote-js"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ceramic/remote-js.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/trivial-ws
	dev-lisp/cl-markup
	dev-lisp/find-port
	test? ( dev-lisp/fiveam trivial-open-browser dev-lisp/bordeaux-threads )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
