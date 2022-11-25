# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d971f3dc5f3e1b952b36c413d1d48367935af2a6"

DESCRIPTION="JSON-RPC 2.0 server/client for Common Lisp"
HOMEPAGE="https://github.com/cxxxr/jsonrpc"
SRC_URI="https://github.com/cxxxr/jsonrpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/yason
	dev-lisp/alexandria
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/event-emitter
	dev-lisp/fast-io
	dev-lisp/trivial-utf8
	dev-lisp/quri
	dev-lisp/websocket-driver
	dev-lisp/clack
	dev-lisp/cl-plus-ssl
	dev-lisp/dissect
	dev-lisp/chanl
	dev-lisp/vom
	test? ( dev-lisp/rove )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "jsonrpc\/tests"/,$d' ${PN}.asd
		rm -r tests
	fi
}
