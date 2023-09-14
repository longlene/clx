# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3745924e4682523b0969a7042bcdb39aa8f73e8f"

DESCRIPTION="Lack, the core of Clack"
HOMEPAGE="https://github.com/fukamachi/lack"
SRC_URI="https://github.com/fukamachi/lack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
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
	
	dev-lisp/quri
	dev-lisp/http-body
	dev-lisp/circular-streams
	dev-lisp/trivial-rfc1123
	
	dev-lisp/cl-dbi
	dev-lisp/marshal
	dev-lisp/trivial-utf8
	dev-lisp/cl-redis
	dev-lisp/trivial-gray-streams
	dev-lisp/babel
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t t-*.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
