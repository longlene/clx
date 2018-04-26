# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b8ef6863f6226f0673d38d8fb95da1cef482ea40"

DESCRIPTION="WebSocket protocols implementation in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/websocket-driver"
SRC_URI="https://github.com/fukamachi/websocket-driver/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-io
	dev-lisp/babel
	dev-lisp/puri
	dev-lisp/cl-base64
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
	dev-lisp/event-emitter
	dev-lisp/cl-async
	dev-lisp/cl-async-future
	dev-lisp/iolib
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	dev-lisp/cl-syntax
	dev-lisp/cl-reexport
"
