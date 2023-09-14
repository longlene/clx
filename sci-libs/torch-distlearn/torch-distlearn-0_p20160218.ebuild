# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit lua vcs-snapshot

EGIT_COMMIT="3836f0c689d5e734053667780020848372e6787c"

DESCRIPTION="A set of distributed learning algorithms for Torch"
HOMEPAGE="https://github.com/twitter/torch-distlearn"
SRC_URI="https://github.com/twitter/torch-distlearn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	dev-lua/torch-ipc
	dev-lua/regress
"

src_install() {
	insinto $(lua_get_sharedir)/distlearn
	doins lua/AllReduce{SGD,EA}.lua
	dodoc README.md
}
