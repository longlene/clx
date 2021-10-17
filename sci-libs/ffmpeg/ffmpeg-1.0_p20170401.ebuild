# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit lua vcs-snapshot

EGIT_COMMIT="8cd93afcfb8a2b405a4cba05120391f0d2884100"

DESCRIPTION="An interface between ffmpeg and Lua/Torch"
HOMEPAGE="https://github.com/clementfarabet/lua---ffmpeg"
SRC_URI="https://github.com/clementfarabet/lua---ffmpeg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	sci-libs/torch-image
	media-video/ffmpeg
"

src_install() {
	insinto $(lua_get_sharedir)/ffmpeg
	doins init.lua
	dodoc README.md
}
