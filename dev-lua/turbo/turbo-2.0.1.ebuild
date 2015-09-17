# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit lua

DESCRIPTION="A networking suite for LuaJIT2"
HOMEPAGE="http://turbolua.org"
SRC_URI="https://github.com/kernelsauce/turbo/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lua/middleclass
"

src_install() {
	lua_install_cmodule libtffi_wrap.so
	lua_install_module -r turbo turbo.lua
	dodoc README.md
}
