# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/fogleman/nes"
EGIT_COMMIT="8f1c50f772008e665866fd5fa00d19c4cccbc081"

DESCRIPTION="NES emulator written in Go"
HOMEPAGE="https://github.com/fogleman/nes"
SRC_URI="https://github.com/fogleman/nes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/gl
	dev-go/glfw
	dev-go/portaudio
"
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/nes
	dodoc src/${EGO_PN}/README.md
}
