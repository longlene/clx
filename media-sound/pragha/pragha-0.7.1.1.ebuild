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
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-db/sqlite
	dev-libs/dbus-glib
	dev-libs/libcdio
	media-libs/libao
	media-libs/libcddb
	media-libs/flac
	media-libs/libmad
	media-libs/libmodplug
	media-libs/libsndfile
	media-libs/libvorbis
	media-libs/taglib
	net-misc/curl
	x11-libs/gtk+
	x11-libs/libnotify"
DEPEND="${RDEPEND}
	sys-devel/gettext"
