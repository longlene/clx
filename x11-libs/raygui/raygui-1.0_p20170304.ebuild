# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="b436708a0ee6d2663b7425aec737016e53463895"

DESCRIPTION="A simple and easy-to-use IMGUI header-only library"
HOMEPAGE="https://github.com/raysan5/raygui"
SRC_URI="https://github.com/raysan5/raygui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-games/raylib
"

src_install() {
	insinto /usr/include
	doins raygui.h
	dodoc README.md
}
