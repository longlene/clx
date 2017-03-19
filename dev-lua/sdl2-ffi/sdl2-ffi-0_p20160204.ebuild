# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="50659fbeca83d667240b197298a0462c7ec0ad21"

DESCRIPTION="A LuaJIT interface to SDL2"
HOMEPAGE="https://github.com/torch/sdl2-ffi"
SRC_URI="https://github.com/torch/sdl2-ffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libsdl2
"

src_install() {
	insinto $(lua_get_sharedir)/sdl2
	doins {init,cdefs,defines}.lua
	dodoc README.md
}
