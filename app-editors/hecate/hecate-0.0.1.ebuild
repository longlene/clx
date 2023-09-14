# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/evanmiller/hecate"

DESCRIPTION="The Hex Editor From Hell"
HOMEPAGE="https://github.com/evanmiller/hecate"
SRC_URI="https://github.com/evanmiller/hecate/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/termbox-go
"
RDEPEND="${DEPEND}"
