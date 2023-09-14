# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="Simple-WebSocket-Server"
HOMEPAGE="https://github.com/eidheim/Simple-WebSocket-Server"
SRC_URI="https://github.com/eidheim/Simple-WebSocket-Server/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include/simple-websocket-server
	doins client_ws.hpp client_wss.hpp crypto.hpp server_ws.hpp server_wss.hpp
	dodoc README.md
}
