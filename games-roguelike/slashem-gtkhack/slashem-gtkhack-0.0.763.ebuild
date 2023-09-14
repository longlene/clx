# Copyright 1999-2004 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games flag-o-matic
append-flags -I../include -I/usr/X11R6/include

SE_VER="0.0.7E6"
SE_FIXVER="${SE_VER}F3"
SE_PN="se007e6f3.tar.gz"
SE_CONF="conf12s.tar.gz"
MY_PN="gtkhack"

DESCRIPTION="GTK+ interface for Slash'EM"
HOMEPAGE="http://www.slashem.org/"
#SRC_URI="http://www.juiblex.co.uk/nethack/slashem/${SE_PN}"
SRC_URI="mirror://sourceforge/slashem/${SE_PN}
	http://www.juiblex.co.uk/nethack/config/${SE_CONF}"

KEYWORDS="~x86"
SLOT="0"
LICENSE="nethack"
IUSE="X gtk"

DEPEND="virtual/glibc
	virtual/x11
	=x11-libs/gtk+-2*
	dev-util/pkgconfig"
DEPEND="${RDEPEND}
        >=sys-apps/sed-4
        dev-util/yacc"

HACKDIR=${GAMES_STATEDIR}/${PN}
S=${WORKDIR}/slashem-${SE_FIXVER}

src_unpack() {
	unpack ${SE_PN}

	# This copies the /sys/unix Makefile.*s to their correct places for
	# seding and compiling.

	cd ${S}/sys/unix
	source setup.sh || die

	unpack ${SE_CONF}
	./config RedHat9 ../..
}

src_compile() {
	cd ${S}/src
	make ../include/pm.h || die "make pm.h"
	make ../include/onames.h || die "make pm.h"
	make nhproxy.a || die "make nhproxy.a"
	cd ${S}/win/gtk
	make -f Makefile.unx gtkhack || die "make gtkhack"
}

src_install() {
	cd ${S}
	insinto ${GAMES_DATADIR}/${MY_PN}
	doins dat/credit.xpm
	doins win/X11/rip.xpm
	dogamesbin win/gtk/gtkhack
	gamesowners ${D}/${GAMES_BINDIR}/${MY_PN}
	gamesperms ${D}/${GAMES_BINDIR}/${MY_PN}

	# install slashem fonts
	dodir ${GAMES_DATADIR}/${MY_PN}/fonts
	cd ${S}/win/X11
	bdftopcf -o nh10.pcf nh10.bdf || die "Converting fonts failed"
	bdftopcf -o ibm.pcf ibm.bdf || die "Converting fonts failed"
	insinto ${GAMES_DATADIR}/${MY_PN}/fonts
	doins *.pcf
	cd ${D}${GAMES_DATADIR}/${MY_PN}/fonts
	mkfontdir || die "The action mkfontdir ${D}{GAMES_DATADIR}/${MY_PN}/fonts failed"

}

pkg_postinst() {
	games_pkg_postinst
}

