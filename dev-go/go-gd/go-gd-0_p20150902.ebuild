# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/bolknote/go-gd"
EGIT_COMMIT="5485d34e8e0a4bb18ef0d23a09cf8e1d5e316a33"

DESCRIPTION="Go bingings for GD"
HOMEPAGE="http://www.boutell.com/gd/"
SRC_URI="https://github.com/bolknote/go-gd/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	media-libs/gd
"
RDEPEND="${DEPEND}"
