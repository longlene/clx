# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_4 )

inherit cmake-utils lua vcs-snapshot

DESCRIPTION="Doom-based AI Research Platform for Reinforcement Learning from Raw Visual Information"
HOMEPAGE="https://github.com/mwydmuch/ViZDoom"
SRC_URI="https://github.com/mwydmuch/ViZDoom/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lua"

DEPEND="
	dev-libs/boost[threads]
	lua? (
		sci-libs/torch7
		sci-libs/torch-image
		sci-libs/torchffi
	)
	media-libs/libsdl2
	media-sound/fluidsynth
"
RDEPEND="${DEPEND}
	games-fps/freedoom
"

CMAKE_IN_SOURCE_BUILD=true

src_prepare() {
	default
	sed -e "s#/usr/local/share/#/usr/share/doom-data/#" \
		-i src/vizdoom/src/posix/i_system.h || die
	sed -e "s#/usr/local/share/doom#/usr/share/doom-data/#" \
		-e "s#/usr/local/share/games/doom#/usr/share/games/doom-data/#" \
		-e "s#/usr/share/games/doom#/usr/share/games/doom-data/freedoom#" \
		-i src/vizdoom/src/gameconfigfile.cpp || die
	sed -e 's#libvizdoom_python luabind#libvizdoom_lua luabind#' -i CMakeLists.txt || die
	sed -e '/workingExePath/{s#\.\/vizdoom#/usr/bin/vizdoom#}' \
		-e '/workingFreedoom2Path\ =/{s#\.\/freedoom2.wad#/usr/share/games/doom-data/freedoom/freedoom2.wad#}' \
		-i src/lib/ViZDoomController.cpp
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_JAVA=OFF
	-DBUILD_LUA=$(usex lua)
	-DBUILD_PYTHON=OFF
	-DDOWNLOAD_FREEDOOM=OFF
	)
	if use lua ; then
		mycmakeargs+=( "-DLUADIR=$(lua_get_sharedir)" )
		mycmakeargs+=( "-DLIBDIR=$(lua_get_libdir)" )
		mycmakeargs+=( "-DLUA_BINDIR=/usr/bin" )
		mycmakeargs+=( "-DLUA_INCDIR=/usr/include" )
		mycmakeargs+=( "-DLUA_LIBDIR=/usr/$(get_libdir)" )
		mycmakeargs+=( "-DLUALIB=/usr/lib/libluajit-5.1.so" )
		mycmakeargs+=( "-DLUA=/usr/bin/luajit" )
	fi
	cmake-utils_src_configure
}

src_install() {
	if use lua ; then
		insinto $(lua_get_sharedir)/vizdoom
		doins src/lib_lua/src_lua/init.lua
		lua_install_cmodule bin/lua/vizdoom.so
	fi
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

