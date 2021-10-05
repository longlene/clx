# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9f7708a9bc8d6f1a9e3a946188c4772adf752058"

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
	dev-lisp/usocket
	dev-lisp/fast-io
	dev-lisp/trivial-utf8
	dev-lisp/alexandria
	dev-lisp/uiop
	test? ( dev-lisp/rove )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "jsonrpc/tests"/,$d' ${PN}.asd
		rm -r tests
	fi
}
