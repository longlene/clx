# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mgutz/ansi/..."
EGIT_COMMIT="c286dcecd19ff979eeb73ea444e479b903f2cfcb"

DESCRIPTION="Small, fast library to create ANSI colored strings and codes"
HOMEPAGE="https://github.com/mgutz/ansi"
SRC_URI="https://github.com/mgutz/ansi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-colorable
"
RDEPEND="${DEPEND}"

src_install() {
	golang-build_src_install
	dobin bin/ansi-mgutz
	dodoc src/${EGO_PN%/*}/README.md
}
