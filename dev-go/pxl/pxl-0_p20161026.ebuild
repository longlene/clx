# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/ichinaski/pxl"
EGIT_COMMIT="9c3ae93d9c25708e6a954fe86e5649306ac71eb8"

DESCRIPTION="Display images in the terminal"
HOMEPAGE="https://github.com/ichinaski/pxl"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/termbox-go
"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${PN}
	dodoc src/${EGO_PN}/README.md
}
