# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit cmake lua vcs-snapshot
inherit lua vcs-snapshot

EGIT_COMMIT="c65ab4ceda001a847c4caa4cf43cf10ebaeedaab"

DESCRIPTION="This library provides utilities for creating and manipulating RNNs to model sequential data"
HOMEPAGE="https://github.com/facebookresearch/torch-rnnlib"
SRC_URI="https://github.com/facebookresearch/torch-rnnlib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sci-libs/torch7
"
RDEPEND="${DEPEND}
	sci-libs/torch-nn
	sci-libs/torch-nngraph
"
src_install() {
	lua_install_module -r rnnlib
	dodoc README.md
}
