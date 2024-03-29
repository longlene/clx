# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Virtual Reality for Lua"
HOMEPAGE="https://github.com/bjornbytes/lovr"
SRC_URI="https://github.com/bjornbytes/lovr/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-games/physfs
	dev-lang/luajit
	media-libs/assimp
	media-libs/freetype
	media-libs/glfw
	media-libs/openal
	virtual/opengl
"
RDEPEND="${DEPEND}"
