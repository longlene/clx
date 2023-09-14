# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/lpereira/gomoku"
EGIT_COMMIT="9b9a508ada50915841c21aaa543a46ad737a8925"

DESCRIPTION="Gomoku compiles Go code to C++"
HOMEPAGE="https://github.com/lpereira/gomoku"
SRC_URI="https://github.com/lpereira/gomoku/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin gomoku
	dodoc src/${EGO_PN}/README.md
}
