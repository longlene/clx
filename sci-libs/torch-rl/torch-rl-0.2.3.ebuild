# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua

DESCRIPTION="A reinforcement learning package implemented in Torch"
HOMEPAGE="https://github.com/vitchyr/torch-rl"
SRC_URI="https://github.com/vitchyr/torch-rl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
"

src_prepare() {
	eapply_user
	mkdir rl
	mv *.lua rl
	mv rl/rl.lua rl.lua
}

src_install() {
	insinto $(lua_get_sharedir)
	doins -r rl{,.lua}
	dodoc -r doc README.md
}
