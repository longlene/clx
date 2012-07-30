# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Qt based XMMS2 client written in python"
HOMEPAGE="http://www.cs.drexel.edu/~jfo24/projs/saxm2s/"

SRC_URI="http://linsam.homelinux.com/projs/${P}.tbz2"
LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="~x86"

DEPEND="dev-python/PyQt
	x11-libs/qt
	dev-util/scons"

RDEPEND="dev-python/PyQt
	x11-libs/qt
	>=media-sound/xmms2-0.2"

RESTRICT="nomirror"

src_compile () {
	scons || die
}

src_install () {
	scons INSTALLDIR=${D} install || die
	dodoc BUGS TODO
}
