# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="e691592773d8acda7371c229fdfd6c22e7c76f02"

DESCRIPTION="cwrap helps generate Lua/C wrappers to interface with C functions."
HOMEPAGE="https://github.com/szagoruyko/loadcaffe"
SRC_URI="https://github.com/szagoruyko/loadcaffe/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"

CMAKE_IN_SOURCE_BUILD=true

src_prepare() {
	eapply_user
	sed -i 's#build/caffe.pb.h#caffe.pb.h#' loadcaffe.cpp
}


src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_sharedir)"
		"-DLIBDIR=$(lua_get_libdir)"
		"-DLUA_BINDIR=/usr/bin"
		"-DLUA_INCDIR=/usr/include/luajit-2.0"
		"-DLUA_LIBDIR=/usr/$(get_libdir)"
		"-DLUALIB=/usr/lib/libluajit-5.1.so"
		"-DLUA=/usr/bin/luajit"
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	dodir $(lua_get_libdir) $(lua_get_sharedir)
	mv "${D}"/usr/lib/* "${D}"/$(lua_get_libdir)
	mv "${D}"/usr/lua/* "${D}"/$(lua_get_sharedir)
	rm -rf "${D}"/usr/lua
}


