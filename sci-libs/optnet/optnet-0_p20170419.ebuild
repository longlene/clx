# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="d380df067126f14ea3e1a0d35f21c322e957e804"

DESCRIPTION="Reducing memory usage in torch neural nets"
HOMEPAGE="https://github.com/fmassa/optimize-net"
SRC_URI="https://github.com/fmassa/optimize-net/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	sci-libs/torch-graph
	sci-libs/torch-nn
"

src_install() {
	insinto $(lua_get_sharedir)/optnet
	doins countUsedMemory.lua env.lua graphgen.lua init.lua models.lua utils.lua
	dodoc README.md
}
