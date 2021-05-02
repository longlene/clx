# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit autotools eutils gnome2

DESCRIPTION="Switch GNOME window management and effects between metacity, gnome-shell, compiz"
HOMEPAGE="http://git.fedoraproject.org/git/desktop-effects.git"
SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

COMMON_DEPEND="gnome-base/gconf
	gnome-base/libglade
	media-libs/mesa
	x11-libs/gtk+:2
	x11-libs/libXcomposite"
DEPEND="${COMMON_DEPEND}
	dev-libs/glib:2
	dev-util/desktop-file-utils
	dev-util/intltool"
RDEPEND="${COMMON_DEPEND}
	gnome-base/gnome-session"

DOCS=( )

pkg_setup() {
	if has_version x11-wm/compiz && ! has_version x11-libs/compizconfig-backend-gconf ; then
		ewarn "You should install and activate x11-libs/compizconfig-backend-gconf"
		ewarn "for x11-wm/compiz to get CCSM changes and compiz option from ${PN} saved."
		ewarn "Please see https://bugzilla.redhat.com/show_bug.cgi?id=532229 for details"
	fi
}

src_prepare() {
	$(has_version ">=x11-libs/gtk+-2.20") && epatch "${FILESDIR}/${P}-gtk-2.20-fix.patch"

	#Gentoo doesn't have compiz-gtk, replace it and add gconf to start string
	sed -i -e 's/compiz-gtk/compiz/' desktop-effects.c || die
	sed -i -e 's/compiz --replace/compiz gconf --replace/' desktop-effects.c || die

	glib-gettextize || die
	intltoolize --copy --force --automake || die
	eautoreconf
}

src_install() {
	gnome2_src_install
	desktop-file-validate "${D}/usr/share/applications/${PN}.desktop" || die
	find "${D}" -name '*.la' -delete die
}
