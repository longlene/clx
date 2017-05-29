# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit lua vcs-snapshot

EGIT_COMMIT="3b2c5f25e13ba424a203910ec62532225f0b9711"

DESCRIPTION="Brings some colours to the boring nn"
HOMEPAGE="https://github.com/Atcold/torch-pretty-nn"
SRC_URI="https://github.com/Atcold/torch-pretty-nn/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	sci-libs/torch7
	sci-libs/torch-nn
"

src_install() {
	insinto $(lua_get_sharedir)/pretty-nn
	doins init.lua
	dodoc README.md
}
