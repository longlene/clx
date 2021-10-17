# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua

DESCRIPTION="Apache Portable Runtime binding for Lua"
HOMEPAGE="https://github.com/xolox/lua-apr"
SRC_URI="https://github.com/xolox/lua-apr/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/apr
"
RDEPEND="${DEPEND}"

src_install() {
	lua_install_module src/apr.lua
	insinto $(lua_get_sharedir)/apr
	doins src/serialize.lua
	insinto $(lua_get_libdir)/apr
	doins core.so
	dodoc README.md
}
