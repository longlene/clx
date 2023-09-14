# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/BurntSushi/graphics-go/..."
EGIT_COMMIT="b43f31a4a96688fba0b612e25e22648b9267e498"

DESCRIPTION="Graphics library for the Go programming language"
HOMEPAGE="https://github.com/BurntSushi/graphics-go"
SRC_URI="https://github.com/BurntSushi/graphics-go/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
