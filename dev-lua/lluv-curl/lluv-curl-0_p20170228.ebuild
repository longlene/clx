# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="fd274b76126ce2201fa2ad5ab6542a4a88040757"

DESCRIPTION="Make asyncronus requests using libuv and libcurl"
HOMEPAGE="https://github.com/moteus/lua-lluv-curl"
SRC_URI="https://github.com/moteus/lua-lluv-curl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lluv
	dev-lua/lua-curl
	dev-lua/eventmitter
"

src_install() {
	insinto $(lua_get_sharedir)/lluv
	doins src/lua/lluv/curl.lua
	dodoc README.md
}
