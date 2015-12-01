# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="mBox is program intended to help you with organizing your music files."
HOMEPAGE="http://www.mbox.wz.cz/"
SRC_URI="http://www.mbox.wz.cz/src/mbox-0.7.2.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ogg mp3 mplayer -python-optimize"

RDEPEND="dev-python/wxpython
ogg? ( dev-python/pyogg dev-python/pyvorbis media-sound/vorbis-tools )
mp3? ( media-sound/lame )
mplayer? ( media-video/mplayer )
python-optimize? ( dev-python/psyco )"
DEPEND=$RDEPEND

src_install()
{
	mkdir -p $D/opt/mBox
	mkdir -p $D/opt/bin
	mkdir -p ${PORTAGE_BUILDDIR}/image/usr/share/applications/
	cp -R $WORKDIR/mBox-0.7.2/* $D/opt/mBox
	ln -s $D/opt/mBox/mbox $D/opt/bin
	chmod o+x $D/opt/bin/mbox
	echo '[Desktop Entry]
Name=mBox
GenericName=Music oriented file manager
Comment=Program intended to help you with organizing your music files.
Exec=/opt/bin/mbox
Icon=/opt/mBox/desktop-icon.png
Terminal=false
Type=Application
Categories=Multimedia;' > ${PORTAGE_BUILDDIR}/image/usr/share/applications/mBox.desktop
}
