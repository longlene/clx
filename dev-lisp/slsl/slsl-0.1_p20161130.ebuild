# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7fcc3170b2326125e5e4659553ca14f88331e99d"

DESCRIPTION="Slack Developer Kit for Common Lisp"
HOMEPAGE="https://github.com/carrotflakes/slsl"
SRC_URI="https://github.com/carrotflakes/slsl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/websocket-driver-client
	dev-lisp/jsown
	dev-lisp/dexador
	dev-lisp/optima
	dev-lisp/cl-ppcre
	dev-lisp/bordeaux-threads
	dev-lisp/clocy
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
