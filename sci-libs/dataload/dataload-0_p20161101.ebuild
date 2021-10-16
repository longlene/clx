# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake lua vcs-snapshot

EGIT_COMMIT="8da729a67fcf17c62ede697e77a82c70b7f5fd00"

DESCRIPTION="A collection of Torch dataset loaders"
HOMEPAGE="https://github.com/Element-Research/dataload"
SRC_URI="https://github.com/Element-Research/dataload/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/lua-5.1:=
	dev-lang/luajit:2
	dev-lua/luafilesystem
	dev-lua/moses
	sci-libs/torch7
	sci-libs/torch-sys
	dev-lua/torch-paths
	sci-libs/torchx
	sci-libs/torch-xlua
	sci-libs/torch-image
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/$(get_libdir)/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
	dodir $(lua_get_sharedir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}
