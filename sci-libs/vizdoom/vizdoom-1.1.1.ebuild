# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils lua vcs-snapshot

DESCRIPTION="Doom-based AI Research Platform for Reinforcement Learning from Raw Visual Information"
HOMEPAGE="https://github.com/mwydmuch/ViZDoom"
SRC_URI="https://github.com/mwydmuch/ViZDoom/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
	sci-libs/torch7
	sci-libs/torch-image
	sci-libs/torchffi
	media-libs/libsdl2
"
RDEPEND="${DEPEND}
	games-fps/freedoom
"

CMAKE_IN_SOURCE_BUILD=true

src_prepare() {
	eapply_user
	sed -e "s#/usr/local/share/#/usr/share/doom-data/#" \
		-i src/vizdoom/src/posix/i_system.h || die
	sed -e "s#/usr/local/share/doom#/usr/share/doom-data/#" \
		-e "s#/usr/local/share/games/doom#/usr/share/games/doom-data/#" \
		-e "s#/usr/share/games/doom#/usr/share/games/doom-data/freedoom#" \
		-i src/vizdoom/src/gameconfigfile.cpp || die
	sed -i '/#\ Freedoom\ 2/,$d' CMakeLists.txt
	sed -e '/workingExePath/{s#\.\/vizdoom#/usr/bin/vizdoom#}' \
		-e '/workingFreedoom2Path\ =/{s#\.\/freedoom2.wad#/usr/share/games/doom-data/freedoom/freedoom2.wad#}' \
		-i src/lib/ViZDoomController.cpp
}

src_configure() {
	local mycmakeargs=(
	"-DBUILD_LUA=ON"
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
	insinto $(lua_get_sharedir)/vizdoom
	doins bin/lua/luarocks_shared_package/init.lua
	lua_install_cmodule bin/lua/vizdoom.so
	insinto /usr
	doins -r include
	insinto /usr/share/vizdoom
	doins -r scenarios examples
	dolib.so bin/libvizdoom.so
	dobin bin/vizdoom
	insinto /usr/share/doom-data
	doins bin/${PN}.pk3
	dodoc README.md
}

pkg_postinst() {
	echo
	elog "Copy or link wad files into /usr/share/doom-data/"
	elog
	elog "To play, simply run:"
	elog
	elog "   vizdoom"
	echo
}

