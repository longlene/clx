# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3e4bedd6a9d9bc4e1dc0a45e5b55360ae30fd388"

DESCRIPTION="HTTP POST data parser"
HOMEPAGE="https://github.com/fukamachi/http-body"
SRC_URI="https://github.com/fukamachi/http-body/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-http
	dev-lisp/jonathan
	dev-lisp/trivial-gray-streams
	dev-lisp/quri
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/cl-utilities
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
