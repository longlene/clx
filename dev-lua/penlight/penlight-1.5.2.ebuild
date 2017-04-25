# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit lua vcs-snapshot

DESCRIPTION="Lua utility libraries loosely based on the Python standard libraries"
HOMEPAGE="http://stevedonovan.github.com/Penlight",
SRC_URI="https://github.com/stevedonovan/Penlight/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/luafilesystem
"

src_install() {
	lua_install_module -r lua/pl
	dodoc README.md
}
