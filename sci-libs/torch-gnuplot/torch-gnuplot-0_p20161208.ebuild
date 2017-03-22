# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="a75e6782bdd5a7aa3ed5c2a0a88b63a916472c66"

DESCRIPTION="Torch interface to Gnuplot"
HOMEPAGE="https://github.com/torch/gnuplot"
SRC_URI="https://github.com/torch/gnuplot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/torch-paths
	sci-libs/torch7
	sci-visualization/gnuplot
"

src_install() {
	insinto $(lua_get_sharedir)/gnuplot
	doins init.lua gnuplot.lua hist.lua
	dodoc README.md
}
