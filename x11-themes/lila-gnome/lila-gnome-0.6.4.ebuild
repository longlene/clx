# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Lila icons for GNOME"
HOMEPAGE="http://lila-theme.berlios.de"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86"

RESTRICT="nomirror nostrip"
SRC_URI="http://download.berlios.de/lila-theme/${PN}_${PV}.tar.bz2"
S=${WORKDIR}

DEPEND="gnome-base/librsvg"

BASEDIR="/usr/share/icons"
src_install() {
		dodir ${BASEDIR}
		cp -R ${S}/* ${D}/${BASEDIR}
}

