# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="General Caching Facility for Common Lisp"
HOMEPAGE="https://github.com/html/clache"
SRC_URI=""

EGIT_REPO_URI="https://github.com/html/clache.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-garbage
	dev-lisp/babel
	dev-lisp/ironclad
	dev-lisp/cl-fad
	dev-lisp/cl-store
	dev-lisp/cl-annot
	dev-lisp/cl-syntax
"

src_prepare() {
	eapply_user
	use test || rm -rf tests ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr
}
