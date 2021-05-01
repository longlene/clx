# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Gists API Wrapper for Common Lisp"
HOMEPAGE="https://github.com/Rudolph-Miller/cl-gists"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Rudolph-Miller/cl-gists.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/trivial-types
	dev-lisp/quri
	dev-lisp/dexador
	dev-lisp/babel
	dev-lisp/jonathan
	dev-lisp/uiop
	test? (
		dev-lisp/prove
		dev-lisp/closer-mop
	)
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all READMD.md
}
