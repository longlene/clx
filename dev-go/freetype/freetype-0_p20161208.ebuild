# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/golang/freetype"
EGIT_COMMIT="d9be45aaf7452cc30c0ceb1b1bf7efe1d17b7c87"

DESCRIPTION="The Freetype font rasterizer in the Go programming language"
HOMEPAGE="https://github.com/golang/freetype"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-go/go-image
"
RDEPEND="${DEPEND}"
