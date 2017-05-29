# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="28026768231c0bea73a4a4eaede5a90324be1404"

DESCRIPTION="Torch extensions"
HOMEPAGE="https://github.com/nicholas-leonard/torchx"
SRC_URI="https://github.com/nicholas-leonard/torchx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	sci-libs/torch-sys
	dev-lua/torch-paths
"

src_install() {
	insinto $(lua_get_sharedir)/torchx
	doins *.lua
	dodoc README.md
}
