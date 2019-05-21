# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8253f7e1fd8fa37f49e7fb28efaef1f7393ff61b"

DESCRIPTION="A simple WebSocket server implementation for lichat"
HOMEPAGE="https://github.com/Shirakumo/lichat-ws-server"
SRC_URI="https://github.com/Shirakumo/lichat-ws-server/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lichat-protocol
	dev-lisp/lichat-serverlib
	dev-lisp/hunchensocket
	dev-lisp/bordeaux-threads
	dev-lisp/documentation-utils
	dev-lisp/verbose
"
BDEPEND=""
