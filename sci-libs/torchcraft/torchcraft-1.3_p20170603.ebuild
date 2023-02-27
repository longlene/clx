# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( luajit )

inherit cmake lua vcs-snapshot

EGIT_COMMIT="bc7ac16944341ab59e3912ab1166f36719492b15"

DESCRIPTION="Connecting Torch to StarCraft"
HOMEPAGE="https://github.com/TorchCraft/TorchCraft"
SRC_URI="https://github.com/TorchCraft/TorchCraft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	dev-lua/penlight
"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodir $(lua_get_libdir) $(lua_get_sharedir)
	mv "${D}"/usr/lib/* "${D}"/$(lua_get_libdir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
	insinto $(lua_get_sharedir)/torchcraft
	doins lua/{_env,init,replayer,utils}.lua
}


