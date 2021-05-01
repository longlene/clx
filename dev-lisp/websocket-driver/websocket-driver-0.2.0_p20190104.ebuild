# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2d20d81f5257111426873b9879795827e4625b83"

DESCRIPTION="WebSocket protocols implementation in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/websocket-driver"
SRC_URI="https://github.com/fukamachi/websocket-driver/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-websocket
	dev-lisp/fast-io
	dev-lisp/event-emitter
	dev-lisp/ironclad
	dev-lisp/cl-base64
	dev-lisp/split-sequence
	dev-lisp/bordeaux-threads
	dev-lisp/usocket
	dev-lisp/cl-plus-ssl
	dev-lisp/fast-http
	dev-lisp/trivial-utf8
	dev-lisp/quri
	dev-lisp/clack
"
