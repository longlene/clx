# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools lua vcs-snapshot

DESCRIPTION="Lua bindings for Curses"
HOMEPAGE="https://github.com/lcurses/lcurses"
SRC_URI="https://github.com/lcurses/lcurses/archive/release-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-libs/ncurses
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
