# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="014f7b19f7d740ed8de66cd6d73ed2d7b09d5168"

DESCRIPTION="PostgreSQL client based on lluv library"
HOMEPAGE="https://github.com/moteus/lua-lluv-pg"
SRC_URI="https://github.com/moteus/lua-lluv-pg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/lluv
	dev-lua/eventmitter
	dev-lua/lmd5
	dev-lua/null
	dev-lua/luuid
"

src_install() {
	lua_install_module -r src/lluv
	dodoc README.md
}
