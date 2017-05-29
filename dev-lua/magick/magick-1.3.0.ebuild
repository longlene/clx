# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

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

src_install() {
	lua_install_module -r magick
	dodoc README.md
}
