# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A simple applet for controlling PulseAudio streams."
SRC_URI="http://gnome-pulse-applet.googlecode.com/files/${P}.tar.gz"
HOMEPAGE="http://gnome-pulse-applet.googlecode.com"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-3"
IUSE=""

DEPEND="
	|| ( >=dev-lang/python-2.5 dev-python/ctypes )
	dev-python/pygtk
	media-sound/pulseaudio
	dev-python/egg-python"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
}
