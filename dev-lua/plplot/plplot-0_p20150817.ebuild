# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="4dbdd7d1ed222f64bac17d47efeccf6314fc4981"

DESCRIPTION="LuaJIT wrapper for PLplot"
HOMEPAGE="https://github.com/deepmind/plplot-ffi"
SRC_URI="https://github.com/deepmind/plplot-ffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/plplot
	sci-libs/torchffi
"

src_install() {
	insinto $(lua_get_sharedir)/plplot
	doins init.lua api.lua cdefs.lua
	dodoc README.md
}
