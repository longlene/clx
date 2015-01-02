# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="WebSocket protocols implementation in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/websocket-driver"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/websocket-driver.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
dev-lisp/cl-reexport"
