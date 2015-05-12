# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit lua git-2

DESCRIPTION="Lua Protocol Buffers"
HOMEPAGE="https://github.com/Neopallium/lua-pb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Neopallium/lua-pb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/lpeg
dev-lua/LuaBitOp
dev-lua/struct
"

src_install() {
	lua_install_module -r pb pb.lua
	dodoc README.md API.md
}
