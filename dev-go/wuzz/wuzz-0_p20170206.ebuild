# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/asciimoo/wuzz"
EGIT_COMMIT="45b6a64e667b3647216af68e06e253958b81b3c4"

DESCRIPTION="Interactive cli tool for HTTP inspection"
HOMEPAGE="https://github.com/asciimoo/wuzz"
SRC_URI="https://github.com/asciimoo/wuzz/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/gocui
"
RDEPEND="${DEPEND}"

src_install() {
	dobin wuzz
	dodoc src/${EGO_PN}/README.md
}
