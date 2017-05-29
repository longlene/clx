# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="2f6ecc5a142972ae7fe40bab4322f1a08ee786ae"

DESCRIPTION="A simple Lua client for REST API"
HOMEPAGE="https://github.com/clementfarabet/restclient"
SRC_URI="https://github.com/clementfarabet/restclient/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luasocket
	dev-lua/lua-cjson
	dev-lua/graphicsmagick
"

src_install() {
	insinto $(lua_get_sharedir)/restclient
	doins init.lua base64.lua
	dodoc README.md
}
