# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="b6e0c38a3e2ddacf9d5b0ad91cfeffc00b22a81c"

DESCRIPTION="Tensor-based vector implementations"
HOMEPAGE="https://github.com/torch/vector"
SRC_URI="https://github.com/torch/vector/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/tds
	sci-libs/torch7
"

src_install() {
	insinto $(lua_get_sharedir)/vector
	doins atomic.lua init.lua string.lua tensor.lua
	dodoc README.md
}

