# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="9c338201de2dee59cef2bd8f8788e10659b9b4ee"

DESCRIPTION="C++ TUI library"
HOMEPAGE="https://github.com/sk2sat/libtui"
SRC_URI="https://github.com/sk2sat/libtui/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake tui.a
}

src_install() {
	newlib.a tui.a libtui.a
	insinto /usr/include
	doins tui.hpp
	insinto /usr/include/tui
	doins tui/{color,config,keyboard,screen,window}.hpp
}
