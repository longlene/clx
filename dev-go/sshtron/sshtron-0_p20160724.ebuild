# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/zachlatta/sshtron"
EGIT_COMMIT="b8eeb4a403ce6bcf2fd821d0b22b5739424b971c"

DESCRIPTION="Play Tron over SSH"
HOMEPAGE="https://github.com/zachlatta/sshtron"
SRC_URI="https://github.com/zachlatta/sshtron/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/golang-petname
	dev-go/color
"
RDEPEND="${DEPEND}"

src_install() {
	dobin sshtron
	dodoc src/${EGO_PN}/README.md
}
