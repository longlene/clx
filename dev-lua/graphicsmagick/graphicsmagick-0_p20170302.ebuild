# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="203df4457613fa612fabe3180217b48fff1d802b"

DESCRIPTION="A simple Lua wrapper to graphicsmagick"
HOMEPAGE="https://github.com/clementfarabet/graphicsmagick"
SRC_URI="https://github.com/clementfarabet/graphicsmagick/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sci-libs/torch-sys
	sci-libs/torch7
	sci-libs/torch-image
"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/graphicsmagick
	doins init.lua convert.lua info.lua exif.lua Image.lua
	dodoc README.md
}
