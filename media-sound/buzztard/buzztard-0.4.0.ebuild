# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic

DESCRIPTION="It is a music production environment like Buzz"
SRC_URI="http://downloads.sourceforge.net/${PN}/${P}.tar.gz"
HOMEPAGE="http://www.buzztard.org/index.php/Building"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

IUSE="mp3 gnome"

RDEPEND="
	media-libs/gstreamer
	media-libs/gst-plugins-base
	media-libs/gst-plugins-good
	media-libs/gst-plugins-buzztard
	dev-libs/glib
	x11-libs/gtk+
	dev-libs/atk
	x11-libs/pango
	gnome-base/librsvg
	gnome-base/gnome-vfs
	dev-libs/libxml2
	gnome-base/libgnomecanvas
	gnome? ( gnome-base/gconf )
	mp3? ( media-libs/gst-plugins-bad )"

DEPEND="${RDEPEND}"

src_compile() {
	filter-ldflags "-Wl,--as-needed"

	local myconf=""

	cd ${S}

	if ! use gnome; then
		myconf="${myconf} --disable-schemas-install"
	fi

	econf \
		${myconf} \
		$(use_with gnome desktop-dir gnome)

	emake || die "make failed"
}

src_install() {
	cd ${S}
	emake DESTDIR=${D} install

	doicon ${S}/pixmaps/gnome/48x48/buzztard.png
	rm ${D}/usr/share/mime/*
}
