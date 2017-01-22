# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/mmcdole/gofeed"
EGIT_COMMIT="53a33226d9de67c4c178c22c82bc071914164a4b"

DESCRIPTION="Parse RSS and Atom feeds in Go"
HOMEPAGE="https://github.com/mmcdole/gofeed"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/goquery
	dev-go/goxpp
"
RDEPEND="${DEPEND}"
