# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit multilib toolchain-funcs flag-o-matic eutils

DESCRIPTION="XMPP client library written in Lua."
HOMEPAGE="http://code.mathewwild.co.uk/"
SRC_URI="http://code.matthewwild.co.uk/verse/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
	dev-lua/squish
	dev-lua/luasocket
	dev-lua/luaexpat
	dev-lua/luafilesystem
	dev-lua/LuaBitOp"
DEPEND="${RDEPEND}"

src_compile() {
squish --use-http
}

src_install() {
	insinto $(pkg-config --variable INSTALL_LMOD lua)
	doins verse.lua || die
	dodoc doc/* || die
}
