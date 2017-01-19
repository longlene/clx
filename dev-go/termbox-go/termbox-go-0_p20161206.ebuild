# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/nsf/termbox-go"
EGIT_COMMIT="cf382c08bd6213ecfc7c75ce681a6d7c51893ca8"

DESCRIPTION="Pure Go termbox implementation"
HOMEPAGE="https://github.com/nsf/termbox-go"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/runewidth
"
RDEPEND="${DEPEND}"

