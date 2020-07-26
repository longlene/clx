# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="A tiny library to compile a system into an executable"
HOMEPAGE="https://github.com/ceramic/trivial-build"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ceramic/trivial-build.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lisp-invocation
	dev-lisp/trivial-exe
"

src_prepare() {
	use test || rm -r t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
