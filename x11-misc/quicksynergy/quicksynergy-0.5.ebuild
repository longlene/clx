# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A a graphical user interface (GUI) for easily configuring
Synergy2."
HOMEPAGE="http://quicksynergy.sourceforge.net/"
SRC_URI="mirror://sourceforge/quicksynergy/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.0
	>=gnome-base/libglade-2.0
	>=x11-misc/synergy-1.2.4"
DEPEND="${RDEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
