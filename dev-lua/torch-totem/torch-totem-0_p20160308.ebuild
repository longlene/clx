# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="21240faf12ee7db95d7adc41760a04ec4ca036d0"

DESCRIPTION="Torch test module"
HOMEPAGE="https://github.com/deepmind/torch-totem"
SRC_URI="https://github.com/deepmind/torch-totem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lua/penlight
	sci-libs/torch7
	sci-libs/torch-sys
	sci-libs/torch-nn
	sci-libs/torch-nngraph
"
RDEPEND="${DEPEND}"

src_install() {
	insinto $(lua_get_sharedir)
	doins -r totem

	exeinto /usr/bin
	doexe scripts/totem-{init,run}

	dodoc README.md
}
