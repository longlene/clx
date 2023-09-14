# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake lua vcs-snapshot

EGIT_COMMIT="0ae574470e6f8ee492fc944aeca0bcb634805bdc"

DESCRIPTION="Torch on steroids"
HOMEPAGE="https://github.com/torchnet/torchnet"
SRC_URI="https://github.com/torchnet/torchnet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-lua/argcheck
	dev-lua/luafilesystem
	dev-lua/md5
	dev-lua/threads
	sci-libs/torch7
	sci-libs/torch-nn
	sci-libs/torch-optim
	dev-lua/tds
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLUA_PATH=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake_src_configure
}

