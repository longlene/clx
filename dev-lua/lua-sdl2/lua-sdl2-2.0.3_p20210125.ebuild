# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )

inherit cmake lua lua vcs-snapshot

EGIT_COMMIT="49ba0848402644a5075d3ce7222bb248dfb49bd1"

DESCRIPTION="A pure C binding of SDL 2.0 for Lua"
HOMEPAGE="https://github.com/Tangent128/luasdl2"
SRC_URI="https://github.com/Tangent128/luasdl2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/sdl2-image
	media-libs/sdl2-mixer
	media-libs/sdl2-net
	media-libs/sdl2-ttf
"
RDEPEND="${DEPEND}"
