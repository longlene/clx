# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

DESCRIPTION="This is a program to convert flv files in avi files"
HOMEPAGE="http://www.kde-apps.org/content/show.php/QFlv2Avi?content=56717"
SRC_URI="http://www.kde-apps.org/CONTENT/content-files/56717-${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="~x86"

DEPEND=">=x11-libs/qt-4
media-video/ffmpeg"

src_compile() {
qmake || die "qmake failed"
emake || die "emake failed"
}

src_install() {
exeinto /usr/bin
doexe qflv2avi
}
