# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake lua vcs-snapshot

EGIT_COMMIT="6e859a09f1c3e7905a84d9805a13a56e1a87b1ac"

DESCRIPTION="An extensible and high performance method of reading, sampling and processing data for Torch"
HOMEPAGE="https://github.com/twitter/torch-dataset"
SRC_URI="https://github.com/twitter/torch-dataset/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sci-libs/torch7
	dev-lua/regress
	dev-lua/luasocket
	dev-lua/luafilesystem
	dev-lua/torch-paths
	dev-lua/torch-ipc
	dev-lua/murmurhash3
"
RDEPEND="${DEPEND}"

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
}


