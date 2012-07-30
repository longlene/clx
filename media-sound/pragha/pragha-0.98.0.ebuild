# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base

DESCRIPTION="Pragha is a lightweight GTK+ music manager"
HOMEPAGE="http://code.google.com/p/dissonance/"
SRC_URI="http://dissonance.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="debug lastfm keybinder"

RDEPEND=">=dev-db/sqlite-3.4
	>=dev-libs/glib-2.16.3
	>=sys-apps/dbus-0.74
	dev-libs/dbus-glib
	>=dev-libs/libcdio-0.78
	>=media-libs/libcddb-1.2.1
	>=net-misc/curl-7.18
	>=x11-libs/gtk+-2.16.0
	>=x11-libs/libnotify-0.4.4
	>=media-libs/libcddb-1.2.1
	>=media-libs/gstreamer-0.10
	>=media-libs/gst-plugins-base-0.10
	>=media-libs/taglib-1.4
	lastfm? ( >=media-libs/libclastfm-0.4 )
	keybinder? ( >=dev-libs/keybinder-0.2.0 )"
DEPEND="${RDEPEND}
	sys-devel/gettext"

src_configure() {
    local myconf

    if use lastfm ; then
    	myconf="${myconf} --enable-libclastfm"
    else
    	myconf="${myconf} --disable-libclastfm"
    fi

    if use keybinder ; then
	myconf="${myconf} --enable-keybinder"
    else
	myconf="${myconf} --disable-keybinder"
    fi

    econf ${myconf} $(use_enable debug)
}
