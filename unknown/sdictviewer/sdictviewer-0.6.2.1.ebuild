# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

DESCRIPTION="SDict Viewer is a viewer for dictionaries in open format developed by AXMA Soft."
HOMEPAGE="http://sdictviewer.sourceforge.net/"
SRC_URI="http://nchc.dl.sourceforge.net/project/sdictviewer/sdictviewer/0.6.2.1/sdictviewer-0.6.2.1-src.zip"

LICENSE="gpl-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/pygtk
>=dev-lang/python-2.5.0"
DEPEND=$RDEPEND

src_unpack()
{
	unpack $A
	cd $WORKDIR/sdictviewer-0.6.2.1
	rm -R debian
}
src_install()
{
	mkdir -p $D/usr/share/icons/hicolor/26x26/apps $D/usr/share/icons/hicolor/scalable/apps $D/usr/share/icons/hicolor/40x40/apps $D/opt/sdictviewer $D/usr/share/applications $D/usr/bin
	mv $WORKDIR/sdictviewer-0.6.2.1/* $D/opt/sdictviewer
	mv $D/opt/sdictviewer/desktop/sdictviewer.desktop $D/usr/share/applications
	rmdir $D/opt/sdictviewer/desktop
	mv $D/opt/sdictviewer/icons/hicolor/26x26/hildon/* $D/usr/share/icons/hicolor/26x26/apps
	mv $D/opt/sdictviewer/icons/hicolor/40x40/hildon/* $D/usr/share/icons/hicolor/40x40/apps
	mv $D/opt/sdictviewer/icons/hicolor/scalable/hildon/* $D/usr/share/icons/hicolor/scalable/apps
	rm -R $D/opt/sdictviewer/icons
	ln -s /opt/sdictviewer/src/sdictviewer.py $D/usr/bin/sdictviewer
	chmod -R o+rx $D/opt/sdictviewer
}