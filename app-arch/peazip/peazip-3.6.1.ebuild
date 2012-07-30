# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="Open Source file and archive manager: flexible, portable, secure, and free as in freedom"
HOMEPAGE="http://www.peazip.org"
SRC_URI="gtk? ( http://peazip.googlecode.com/files/peazip-3.6.1.LINUX.GTK2.tgz )
qt? ( http://peazip.googlecode.com/files/peazip-3.6.1.LINUX.Qt.tgz )"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-gtk +qt +kde"
RESTRICT=mirror

RDEPEND="amd64? ( gtk? ( app-emulation/emul-linux-x86-gtklibs ) 
	app-emulation/emul-linux-x86-baselibs 
	app-emulation/emul-linux-x86-xlibs 
	app-emulation/emul-linux-x86-opengl 
	qt? ( app-emulation/emul-linux-x86-qtlibs ) )
x86? ( dev-libs/atk
	dev-libs/expat
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libpng
	media-libs/mesa
	gtk? ( x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+ )
	qt? ( x11-libs/qt-core
	x11-libs/qt-gui )
)"
DEPEND=$RDEPEND

src_unpack()
{
	if use gtk
	then
		unpack peazip-3.6.1.LINUX.GTK2.tgz
	else
		unpack peazip-3.6.1.LINUX.Qt.tgz
	fi
	if use !kde
	then
		rm -Rf $WORKDIR/usr/share
	fi
	if use !qt && !gtk
	then
	die "You need to select one of qt or gtk."
	fi
	if use gtk && qt
	then
	die "You need to select one of qt or gtk."
	fi
}
src_install()
{
	chmod -R 755 $WORKDIR/*
	chown root:root $WORKDIR/*
	mv $WORKDIR/* $D
}