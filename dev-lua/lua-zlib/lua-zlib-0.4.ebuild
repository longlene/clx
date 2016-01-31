# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from Lua overlay; Bumped by mva; $

EAPI="4"

inherit cmake-utils lua

DESCRIPTION="Lua bindings to zlib"
HOMEPAGE="http://github.com/brimworks/lua-zlib"
SRC_URI="https://github.com/brimworks/lua-zlib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="luajit"

RDEPEND="|| ( >=dev-lang/lua-5.1 dev-lang/luajit:2 )
sys-libs/zlib"
DEPEND="${RDEPEND}
dev-util/pkgconfig"
src_configure() {
	local mycmakeargs=(
	cmake-utils_use_use luajit LUAJIT
	"-DINSTALL_CMOD='$(pkg-config --variable INSTALL_CMOD lua)'"
	"-DUSE_LUA_VERSION=${LUA_VER}"
	)
	cmake-utils_src_configure
}
