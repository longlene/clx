# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7087d9cf4c3f7da4c68a275ad79eda853ac6f1b9"

DESCRIPTION="Optimized low-level websocket protocol parser written in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/fast-websocket"
SRC_URI="https://github.com/fukamachi/fast-websocket/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-io
	dev-lisp/trivial-utf8
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources README.markdown
}
