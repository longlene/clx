# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..3} luajit )

inherit lua cmake

DESCRIPTION="Lua integration with libev"
HOMEPAGE="https://github.com/brimworks/lua-ev"
SRC_URI="https://github.com/brimworks/lua-ev/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/libev"

src_configure() {
	local mycmakeargs=(
		-DINSTALL_CMOD=$(lua_get_libdir)
	)
	cmake_src_configure
}
