# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils flag-o-matic

IUSE="gtk xmms"
SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}-mls.tar.bz2"
DESCRIPTION="Nosefart NES format sound player"
HOMEPAGE="http://nosefart.sourceforge.net/"

RDEPEND="gtk? ( media-libs/libpng
                x11-libs/libXxf86vm
                x11-libs/libXext
                x11-libs/libXi
                =x11-libs/gtk+-2*
                =dev-libs/glib-2* )
		 xmms? ( media-sound/xmms )"

DEPEND="${RDEPEND}
        >=sys-devel/automake-1.9
        >=sys-devel/autoconf-2.5"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc-macos ~ppc64 ~sparc ~x86"
S=${WORKDIR}/${P}-mls
GTK_NOSEFART_DIR=`ls ${S}/src | grep gnosefart`
src_compile() {
	emake || die
	if use gtk; then
		einfo "Including gnosefart GTK+ based GUI for nosefart"
		cd ${S}/src/${GTK_NOSEFART_DIR}
		econf --prefix="${D}" --datadir="${D}/share" || die
		emake || die
	fi;
	if use xmms; then
		einfo "Including XMMS plugin for nosefart"
		cd ${S}/src/xmms
		econf || die
		emake || die
	fi;
	cd ${S}
}

src_install() {
	make PREFIX="${D}" install || die
	if use gtk; then
		cd ${S}/src/${GTK_NOSEFART_DIR}
		make prefix="${D}" install || die
	fi;
	if use xmms; then
		cd ${S}/src/xmms
#		make DESTDIR="${D}" install || die
		exeinto `xmms-config --input-plugin-dir`
		doexe ${S}/src/xmms/.libs/libnosefart.so || die
	fi;
}