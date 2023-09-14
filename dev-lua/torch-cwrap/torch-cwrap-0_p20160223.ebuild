# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

inherit cmake lua-single vcs-snapshot

EGIT_COMMIT="dbd0a623dc4dfb4b8169d5aecc6dd9aec2f22792"

DESCRIPTION="cwrap helps generate Lua/C wrappers to interface with C functions."
HOMEPAGE="https://github.com/torch/cwrap"
SRC_URI="https://github.com/torch/cwrap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

REQUIRED_USE="${LUA_REQUIRED_USE}"

DEPEND="${LUA_DEPS}"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		"-DLUADIR=$(lua_get_lmod_dir)"
	)

	cmake_src_configure
}

