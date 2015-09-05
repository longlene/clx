# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua git-2

DESCRIPTION="Simple wrapper around luasocket ftp"
HOMEPAGE="https://github.com/moteus/lua-ftp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/moteus/lua-ftp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/luasocket
dev-lua/lua-path
"

src_install() {
	lua_install_module lua/ftp.lua
	dodoc README.md
}
