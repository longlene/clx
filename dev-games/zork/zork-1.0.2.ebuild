# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit games

DESCRIPTION="The DUNGEON (Zork I) source"
HOMEPAGE="https://github.com/devshane/zork"
SRC_URI="https://github.com/devshane/zork/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sys-libs/libtermcap-compat
"
RDEPEND="${DEPEND}"

src_install() {
	dobin zork
	doman dungeon.6
	insinto ${GAMES_PREFIX}/zork
	doins dtextc.dat
}

