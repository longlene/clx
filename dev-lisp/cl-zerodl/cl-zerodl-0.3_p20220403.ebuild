# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5ba334423b5e5411fd0fff59af5f0cda16f67646"

DESCRIPTION="ゼロから作るDeep Learningのサンプルコード (Common Lisp版)"
HOMEPAGE="https://github.com/masatoi/cl-zerodl"
SRC_URI="https://github.com/masatoi/cl-zerodl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mgl-mat
	dev-lisp/cl-libsvm-format
	dev-lisp/alexandria
	test? ( dev-lisp/rove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
	rm -r example
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
