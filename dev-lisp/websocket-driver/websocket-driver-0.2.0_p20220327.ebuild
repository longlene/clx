# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0ef31fce279c1cc02f8a020a285047180649bcc6"

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
	dev-lisp/quri
	dev-lisp/clack
"
