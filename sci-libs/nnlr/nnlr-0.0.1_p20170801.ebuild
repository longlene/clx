# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="c993a358304eac3b26b230c09afc4668aee0f501"

DESCRIPTION=" Add layer-wise learning rate schemes to Torch"
HOMEPAGE="https://github.com/gpleiss/nnlr"
SRC_URI="https://github.com/gpleiss/nnlr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lua/moses
	sci-libs/torch7
"

src_install() {
	lua_install_module nnlr.lua
	dodoc README.md
}
