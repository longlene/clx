# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Open Source file and archive manager: flexible, portable, secure, and free as in freedom"
HOMEPAGE="http://www.peazip.org"
SRC_URI="gtk? ( http://peazip.googlecode.com/files/$P.LINUX.GTK2.tgz )
qt4? ( http://peazip.googlecode.com/files/$P.LINUX.Qt.tgz )"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-gtk +qt4 +kde"
RESTRICT=mirror

RDEPEND="amd64? ( gtk? ( app-emulation/emul-linux-x86-gtklibs ) 
	app-emulation/emul-linux-x86-baselibs 
	app-emulation/emul-linux-x86-xlibs 
	app-emulation/emul-linux-x86-opengl 
	qt4? ( app-emulation/emul-linux-x86-qtlibs ) )
x86? ( dev-libs/atk
	dev-libs/expat
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libpng
	media-libs/mesa
	gtk? ( x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+ )
	qt4? ( x11-libs/qt-core
	x11-libs/qt-gui ) )"
DEPEND=$RDEPEND

src_unpack()
{
	if use gtk
	then
		unpack $P.LINUX.GTK2.tgz
	else
		unpack $P.LINUX.Qt.tgz
	fi
	if use !kde
	then
		rm -Rf $WORKDIR/usr/share
	fi
	cp -Rf $WORKDIR/usr/local/* $WORKDIR/usr
	rm -Rf $WORKDIR/usr/local
	mkdir -p usr/share/icons/hicolor/256x256/apps
	mv usr/share/icons/peazip.png usr/share/icons/hicolor/256x256/apps
	if use !kde
	then
		rm -Rf $WORKDIR/usr/share/kde4
		rm -Rf $WORKDIR/opt
	fi
}
src_install()
{
	chmod -R 755 $WORKDIR/*
	chown root:root $WORKDIR/*
	mv $WORKDIR/* $D
}