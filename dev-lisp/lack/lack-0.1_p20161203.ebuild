# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="824436ac3c9bf93ed0afd83fcd18fc455c5d8a3b"

DESCRIPTION="Lack, the core of Clack"
HOMEPAGE="https://github.com/fukamachi/lack"
SRC_URI="https://github.com/fukamachi/lack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

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
	
	dev-lisp/cl-dbi
	dev-lisp/marshal
	test? ( dev-lisp/prove )
"

src_prepare() {
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
