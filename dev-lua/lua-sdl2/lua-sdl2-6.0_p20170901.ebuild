# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils lua vcs-snapshot

EGIT_COMMIT="6df26c7c24d34fdedf1b1d6557adfa06d740f50f"

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
