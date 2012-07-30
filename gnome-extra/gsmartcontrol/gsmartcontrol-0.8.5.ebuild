# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="Graphical user interface for smartctl"
HOMEPAGE="http://gsmartcontrol.berlios.de/home/index.php/en/Home"
SRC_URI="http://download.berlios.de/gsmartcontrol/${P}.tar.bz2"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-cpp/gtkmm-2.12
	>=x11-libs/gtk+-2.12
	dev-libs/libpcre
	sys-apps/smartmontools"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

DOCS="AUTHORS.txt ChangeLog NEWS README.txt"

src_unpack() {
	unpack "${P}.tar.bz2"
	cd "${S}"
}
