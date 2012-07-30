# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Global Menu is the globally-shared menu bar for GNOME"
HOMEPAGE="http://code.google.com/p/gnome2-globalmenu/"
SRC_URI="http://gnome2-globalmenu.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86"
IUSE="gnome xfce test"

DEPEND=">=x11-libs/gtk+-2.10.0
		>=dev-libs/glib-2.10.0
		>=gnome-base/gconf-2
		>=x11-libs/libwnck-2.16.0
		>=gnome-base/gnome-menus-2.16.0
		gnome? (
				>=gnome-base/gnome-panel-2.16.0
				>=x11-libs/libnotify-0.4.4 )
		xfce?	(
				>=xfce-base/xfce4-panel-4.4.3 )
		>=x11-libs/libX11-1.1.0"
RDEPEND="${DEPEND}
		dev-util/intltool
		dev-util/pkgconfig
		>=dev-lang/vala-0.7.3"

src_compile() {
	G2CONF="${G2CONF}
		--without-git
		--docdir=/usr/share/doc/${PF}"

	econf \
		$(use_enable test tests) \
		$(use_with gnome gnome-panel) \
		$(use_with xfce xfce4-panel)
	
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed" 
	dodoc README || die
}

pkg_postinst() {
	elog 'If make install failed try FEATURES="-sandbox" emerge gnome-globalmenu'
}
