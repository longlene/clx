# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="GConf Cleaner is a tool to clean GConf database up that is possibly cluttered with unnecessary or invalid keys."
HOMEPAGE="http://code.google.com/p/gconf-cleaner/"
SRC_URI="http://gconf-cleaner.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"
IUSE=""

RDEPEND="
	gnome-base/gnome-desktop
	gnome-base/gnome-session
	>=x11-libs/gtk+-2.6
	>=gnome-base/gconf-2.0"
	
DEPEND="${RDEPEND}
	dev-util/pkgconfig"


src_unpack() {
  unpack ${A}
} 

src_compile() {
  econf || die
  emake || die
}

src_install() {
  make DESTDIR=${D} install || die
  dodoc README FAQ CHANGELOG
}

