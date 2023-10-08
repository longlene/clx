# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ff606c1ff373b6b07380978f848cf6b6aa192977"

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
	dev-lisp/sha1
	dev-lisp/cl-base64
	dev-lisp/split-sequence
	dev-lisp/bordeaux-threads
	dev-lisp/usocket
	dev-lisp/cl-plus-ssl
	dev-lisp/fast-http
	dev-lisp/babel
	dev-lisp/quri
	dev-lisp/clack
"
