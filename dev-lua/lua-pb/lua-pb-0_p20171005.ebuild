# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="1253c85d7c67dc355ec8d827df74d72c4eee3e3f"

DESCRIPTION="Lua Protocol Buffers"
HOMEPAGE="https://github.com/Neopallium/lua-pb"
SRC_URI="https://github.com/Neopallium/lua-pb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/lpeg
dev-lua/luabitop
dev-lua/struct
"

src_install() {
	lua_install_module -r pb pb.lua
	dodoc README.md API.md
}
