# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion 

ESVN_REPO_URI="http://gnome-pulse-applet.googlecode.com/svn/trunk/"
ESVN_PROJECT="gnome-pulse-applet"

DESCRIPTION="A simple applet for controlling PulseAudio streams."
#SRC_URI="http://gnome-pulse-applet.googlecode.com/files/${P}.tar.gz"
HOMEPAGE="http://gnome-pulse-applet.googlecode.com"
KEYWORDS="~x86"
SLOT="0"
LICENSE="GPL-3"
IUSE=""

DEPEND="
	|| ( >=dev-lang/python-2.5 dev-python/ctypes )
	dev-python/pygtk
	media-sound/pulseaudio
	dev-python/egg-python"

src_compile() {
	cd "${S}"
	emake || die "emake failed"
}

src_install() {
	# BUGFIX until
	# http://code.google.com/p/gnome-pulse-applet/issues/detail?id=65
	# isn't fixed
	mkdir -p ${D}/usr/lib/python2.5/site-packages/

	emake DESTDIR="${D}" install || die "make install failed"
}

