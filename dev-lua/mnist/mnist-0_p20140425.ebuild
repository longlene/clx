# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="37dfe57bdb72a99663f3bfe59a45f8c8b12d9a0c"

DESCRIPTION="Mnist dataset for Torch"
HOMEPAGE="https://github.com/andresy/mnist"
SRC_URI="https://github.com/andresy/mnist/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sci-libs/torch7
	dev-lua/torch-paths
"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)/mnist
	doins -r init.lua data
	dodoc README.md
}

