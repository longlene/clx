# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="GDM Themes from the gnome-colors project"
HOMEPAGE="http://code.google.com/p/gnome-colors"
SRC_URI="http://gnome-colors.googlecode.com/files/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
# We can add an use "branding" which changes the default logo
# of the GDM themes with a Gentoo one
IUSE=""
RDEPEND="gnome-base/gdm"
# To build it nothing more the default tools is needed
DEPEND=""

src_prepare() {
	# Correct the directory where background images will be saved
	# because Gentoo use /usr/share/pixmaps/backgrounds instead
	# of /usr/share/backgrounds used by the upstream
	sed -i -e "s;backgrounds;pixmaps/backgrounds;g" Makefile \
						gnome-background-properties/*.xml || \
		eerror "Failed to change backgrounds directory"
}

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	emake DESTDIR="${D}" install || eerror "Install phase failed"
}
