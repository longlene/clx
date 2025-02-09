# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7f5219c55d49190f5ae17b123a8729b31c5d706e"

DESCRIPTION="A fast non-blocking HTTP server on top of libev"
HOMEPAGE="https://github.com/fukamachi/woo/"
SRC_URI="https://github.com/fukamachi/woo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lev
	dev-lisp/clack[test?]
	dev-lisp/swap-bytes
	dev-lisp/cffi
	dev-lisp/static-vectors
	dev-lisp/bordeaux-threads
	dev-lisp/fast-http
	dev-lisp/quri
	dev-lisp/fast-io
	dev-lisp/smart-buffer
	dev-lisp/trivial-utf8
	dev-lisp/vom
	dev-lisp/alexandria
	dev-lisp/cl-speedy-queue
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
