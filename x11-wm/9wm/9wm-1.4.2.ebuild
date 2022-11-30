# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils

DESCRIPTION="X11 Window Manager inspired by Plan 9's rio"
HOMEPAGE="https://github.com/9wm/9wm"
SRC_URI="https://github.com/9wm/9wm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="9wm"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND="x11-libs/libX11
		x11-libs/libXext
		x11-terms/xterm"

src_install() {
	dobin "${PN}"
	mv "${PN}.man" "${PN}.1"
	doman "${PN}.1"
	dodoc README.md
}
