# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="db14b3a1b829a366a676ac305425fb693aba444c"

DESCRIPTION="Lua binding for the libvips image processing library"
HOMEPAGE="https://github.com/jcupitt/lua-vips"
SRC_URI="https://github.com/jcupitt/lua-vips/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/vips
"

src_install() {
	lua_install_module -r src/vips{,.lua}
	dodoc README.md
}
