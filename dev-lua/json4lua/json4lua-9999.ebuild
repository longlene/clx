# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-2

DESCRIPTION="JSON4Lua and JSONRPC4Lua implement JSON encoding and decoding and a JSON-RPC-over-HTTP client for lua"
HOMEPAGE="https://github.com/craigm/json4lua"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/craigm/json4lua.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
"

src_install() {
	lua_install_module -r json
	dodoc README.md
}
