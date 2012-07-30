#Copyright 1999-2010 Gentoo Foundation
#Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
inherit qt4-r2

GIT_COMMIT_ID="" # ".f63ea12"
DESCRIPTION="Graphical user interface front end supporting MP3Gain engine"
HOMEPAGE="http://qmp3gain.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PV}/${P}${GIT_COMMIT_ID}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""

RDEPEND=">=media-sound/mp3gain-1.5.2
	media-sound/phonon
	x11-libs/qt-assistant:4
	x11-libs/qt-core:4
	x11-libs/qt-gui:4
	x11-libs/qt-gui:4
	x11-libs/qt-webkit:4
	x11-libs/qt-sql:4
	x11-libs/qt-xmlpatterns:4"
	#x11-libs/qt-phonon:4
DEPEND="${RDEPEND}"
S=${WORKDIR}/${P}

