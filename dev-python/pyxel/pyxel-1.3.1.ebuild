# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_6 )
inherit distutils-r1

DESCRIPTION="A retro game engine for Python"
HOMEPAGE="https://github.com/kitao/pyxel"
SRC_URI="https://github.com/kitao/pyxel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libsdl2
	media-libs/sdl2-image
"
BDEPEND=""
