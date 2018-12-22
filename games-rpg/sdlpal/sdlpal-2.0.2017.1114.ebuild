# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Reimplementation of the classic Chinese-language RPG \"Xiān jiàn Qí Xiá Zhuàn\""
HOMEPAGE="https://github.com/sdlpal/sdlpal"
SRC_URI="https://github.com/sdlpal/sdlpal/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libsdl2
"
BDEPEND=""

src_compile() {
	emake -C unix
}

src_install() {
	dobin unix/sdlpal
	dodoc README.md
}

