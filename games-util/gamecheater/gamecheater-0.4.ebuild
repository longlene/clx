# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A Gtk+ Game Cheater. It use ptrace system call to edit other process' memory"
HOMEPAGE="http://gamecheater.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~x86 ~amd64"

IUSE=""
DEPEND=">=dev-libs/glib-2.6
	>=x11-libs/gtk+-2.6
	>=gnome-base/libglade-2.4"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc ChangeLog README
	make_desktop_entry "${PN}" "Game Cheater" "/usr/share/${PN}/pixmaps/${PN}.png"
}
