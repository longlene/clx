# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/skyeye/skyeye-1.0.0.ebuild,v 1.3 2006/01/03 23:36:00 vapier Exp $

DESCRIPTION="an ARM embedded hardware simulator"
HOMEPAGE="http://www.skyeye.org/"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/skyeye/${P}_Rel.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="sys-libs/ncurses
	media-libs/freetype
	>=x11-libs/gtk+-2
	>=dev-libs/glib-2
	x11-libs/pango"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

src_install() {
	dobin binary/skyeye || die "skyeye"
	dodoc ChangeLog README
}
