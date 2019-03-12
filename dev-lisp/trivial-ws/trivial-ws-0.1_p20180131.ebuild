# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_COMMIT="ebf1ec0ea26bdac4007e98e89f3a621dbfb4390a"

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Trivial WebSockets"
HOMEPAGE="https://github.com/ceramic/trivial-ws"
SRC_URI="https://github.com/ceramic/trivial-ws/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchensocket
	dev-lisp/websocket-driver
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
