# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua cmake

DESCRIPTION="Lua binding to libsodium"
HOMEPAGE="https://github.com/jprjr/luasodium"
SRC_URI="https://github.com/jprjr/luasodium/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}
	dev-libs/libsodium
"

DOCS=( README.md )

each_src_configure() {
	local mycmakeargs=(
		-DLUASODIUM_VERSION="${PV}"
	)
	cmake_src_configure
}

src_configure() {
	lua_foreach_impl each_src_configure
}

src_compile() {
	lua_foreach_impl cmake_src_compile
}

src_install() {
	lua_foreach_impl cmake_src_install
	einstalldocs
}
