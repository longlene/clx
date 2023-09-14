# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/jroimartin/gocui"
EGIT_COMMIT="c690b943b6427bf9a3bca8b88cbd8457afcaac37"

DESCRIPTION="Minimalist Go package aimed at creating Console User Interfaces"
HOMEPAGE="https://github.com/jroimartin/gocui"
SRC_URI="https://github.com/jroimartin/gocui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/termbox-go
"
RDEPEND="${DEPEND}"
