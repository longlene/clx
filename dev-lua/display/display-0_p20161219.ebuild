# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="7de58efdceaf7dcec77a247d89e6f48db77e4292"

DESCRIPTION="Lightweight browser-based display server"
HOMEPAGE="https://github.com/szym/display"
SRC_URI="https://github.com/szym/display/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lua/async
	dev-lua/luasocket
	dev-lua/lua-cjson
	sci-libs/torch7
	sci-libs/torch-sys
	sci-libs/torch-image
"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/display
	doins -r init.lua server.lua start.lua static plugins
	dodoc README.md
}
