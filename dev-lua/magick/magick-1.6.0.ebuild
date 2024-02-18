# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( lua5-{1..4} luajit )

inherit lua

DESCRIPTION="Lua bindings to ImageMagick for LuaJIT using FFI"
HOMEPAGE="https://github.com/leafo/magick"
SRC_URI="https://github.com/leafo/magick/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-gfx/imagemagick
"

src_compile() {
	:
}

lua_src_install() {
	insinto $(lua_get_lmod_dir)
	doins -r magick
}

src_install() {
	lua_foreach_impl lua_src_install
	dodoc README.md
}
