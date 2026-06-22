# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Experimental minimal IRC-like chat in Common Lisp over TCP sockets"
HOMEPAGE="https://github.com/ryukinix/lisp-chat https://chat.manoel.dev"
SRC_URI="https://github.com/ryukinix/lisp-chat/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/cl-readline
"

src_install() {
	common-lisp-3_src_install
	newbin bin/client.py lisp-chat-client
	newbin bin/client_curses.py lisp-chat-client-curses
}
