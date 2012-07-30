# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 eutils

IUSE=""

DESCRIPTION="different wallpapers for different Gnome workspaces"
HOMEPAGE="http://wallpapoz.sourceforge.net/"
SRC_URI="mirror://sourceforge/wallpapoz/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

S="${WORKDIR}/${P}"

DEPEND=">=dev-cpp/libxmlpp-2.6
		>=dev-cpp/libglademm-2.4
		>=gnome-base/gnome-2.6"
RDEPEND="gnome-base/gnome
		>=sys-devel/autoconf-2.58"


src_unpack() {
    unpack ${A}
    epatch ${FILESDIR}/${P}-*.patch
	sed -i "s:/usr/share:\$\{datadir\}:g" ${S}/Makefile.am
}

#src_install() {
#	dodoc AUTHORS COPYING ChangeLog README TODO
#	dobin wallpapoz daemon_wallpapoz
#	einstall
#}


pkg_postinst() {

    gnome2_pkg_postinst

}

