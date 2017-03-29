# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="83167716b35eedc1ff2f88ccb72ac66622006833"

DESCRIPTION="Persist: a simple persisting table for Torch"
HOMEPAGE="https://github.com/clementfarabet/persist"
SRC_URI="https://github.com/clementfarabet/persist/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/redis-lua
	dev-lua/lua-cjson
	sci-libs/torch-sys
"

src_install() {
	insinto $(lua_get_sharedir)/persist
	doins init.lua
	dodoc README.md
}
