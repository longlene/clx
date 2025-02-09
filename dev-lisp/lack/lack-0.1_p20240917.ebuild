# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="866b5f5c082db0f9c7e7c78b46ed2459391c6423"

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

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
