# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/lukehoban/go-outline"
EGIT_COMMIT="e785568742524aa488d7332e7619dba87b2a8b9d"

DESCRIPTION="Utility to extract JSON representation of declarations from a Go source file"
HOMEPAGE="https://github.com/lukehoban/go-outline"
SRC_URI="https://github.com/lukehoban/go-outline/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin go-outline
	dodoc src/${EGO_PN}/README.md
}
