# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit bzr eutils games python

DESCRIPTION="MAME frontend suited to cabinet use"
HOMEPAGE="https://launchpad.net/wahcade"
SRC_URI=""
EBZR_REPO_URI="lp:wahcade"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

IUSE="joystick gstreamer"

PYTHON_DEPEND="2:2.6"
DEPEND="dev-util/glade[python]
dev-python/pygtk
dev-python/pycairo
dev-python/pygobject
dev-python/imaging
dev-python/chardet
joystick? ( dev-python/pygame )
gstreamer? ( dev-python/gst-python )"

RDEPEND="${DEPEND}
app-arch/unzip"

src_unpack() {
	bzr_src_unpack
}

src_prepare() {
	cd "${S}"
	sed -i 's#PREFIX=/usr/local#PREFIX=${D}usr/games#' install
	sed -i 's#/usr/share/applications#${D}usr/share/applications#' install
	sed -i 's#/usr/share/pixmaps#${D}usr/share/pixmaps#' install

	# workaround non-working sed in src_install
	sed -i 's#echo "cd ${DESTDIR}" >> $BINDIR/#echo "cd /usr/games/share/wahcade" >> $BINDIR/#' install

	epatch "${FILESDIR}/keypad.patch"
}

src_install() {
	install --directory ${D}usr/share/applications
	install --directory ${D}usr/share/pixmaps
	install --directory ${D}usr/games/bin
	cd "${S}"
	./install
	# doesn't work here, works on command line
	#cd "${D}usr/games/bin"
	#sed -i 's#${D}#/#' wahcade*
}

