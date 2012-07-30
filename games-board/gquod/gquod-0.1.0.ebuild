# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit eutils games

MY_PN="gnome-quod"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The player who makes a square on a grid first wins."
HOMEPAGE="http://sourceforge.net/projects/gquod"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}_${PV}-1.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${RDEPEND}
	dev-util/pkgconfig"
RDEPEND="dev-cpp/gtkmm:2.4
	gnome-base/librsvg"

S="${WORKDIR}/${MY_P}"

src_compile() {
	egamesconf
	emake || die "emake failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "install failed"

	doicon pixmaps/quod.png || die "doicon failed"
	make_desktop_entry "quod" "Gnome Quod" "quod.png" || die "domenu failed"

	dodoc AUTHORS ChangeLog NEWS README THANKS || die "dodoc failed"

	prepgamesdirs
}
