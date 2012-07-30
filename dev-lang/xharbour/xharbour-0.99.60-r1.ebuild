# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

IUSE="allegro gpm odbc slang X"
DESCRIPTION="An extended implementation of the Clipper dialect of the xBase language family"
HOMEPAGE="http://www.xharbour.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.src.tar.gz"

LICENSE="harbour"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~ppc-macos ~s390 ~sparc ~x86"

RDEPEND="virtual/libc
	sys-libs/ncurses
	allegro? ( media-libs/allegro )
	gpm? ( sys-libs/gpm )
	odbc? ( dev-db/unixODBC )
	slang? ( sys-libs/slang )
	X? ( x11-libs/libX11
	     x11-libs/libXmu
		 x11-libs/libXext
		 x11-libs/libXt
		 x11-libs/libXpm
	     media-libs/freetype )"

DEPEND="${RDEPEND}
	sys-devel/bison"

set_vars() {
	export \
		C_USR="${CFLAGS}" \
		HB_GTALLEG=`useq allegro && echo yes` \
		HB_GPM_MOUSE=`useq gpm && echo yes` \
		HB_WITHOUT_GTSLN=`useq slang || echo yes` \
		HB_WITHOUT_X11=`useq X || echo yes`
}

src_compile() {
	chmod a+x make_gnu.sh
	set_vars
	./make_gnu.sh
}

src_test() {
	utils/hbtest/*/*/hbtest
	einfo "In general, the package works if 'Total calls passed' figure above"
	einfo "is 90% or greater."
}

src_install() {
	#make install for the package does not create dirs if they are missing for some reason
	dodir /usr/bin
	dodir /usr/include/xharbour
	dodir /usr/lib/xharbour
	dodir /usr/share/doc/${PF}
	export _DEFAULT_BIN_DIR=/usr/bin
	export _DEFAULT_INC_DIR=/usr/include/xharbour
	export _DEFAULT_LIB_DIR=/usr/lib/xharbour
	export HB_BIN_INSTALL=${D}/usr/bin
	export HB_INC_INSTALL=${D}/usr/include/xharbour
	export HB_LIB_INSTALL=${D}/usr/lib/xharbour
	set_vars
	./make_gnu.sh install || die
	
	dodir /etc/harbour
	install -m644 source/rtl/gtcrs/hb-charmap.def ${D}/etc/harbour/hb-charmap.def
	cat > ${D}/etc/harbour.cfg <<EOF
CC=gcc
CFLAGS=-c -I${_DEFAULT_INC_DIR} ${CFLAGS}
VERBOSE=YES
DELTMP=YES
EOF
	
	# rebuild tools with shared libs
	unset HB_GTALLEG
	L_USR="-L${HB_LIB_INSTALL} -l${PN} -lncurses"
	use slang && L_USR="${L_USR} -lslang"
	use gpm && L_USR="${L_USR} -lgpm"
	use X && L_USR="-L/usr/X11R6/lib -lX11"
	export L_USR
	export PRG_USR="\"-D_DEFAULT_INC_DIR='${_DEFAULT_INC_DIR}'\""
	for utl in hbmake hbrun hbpp xbscript
	do
		./make_gnu.sh -C utils/${utl} clean
		./make_gnu.sh -C utils/${utl} install
	done
	
	dosym xbscript /usr/bin/pprun
	dosym xbscript /usr/bin/xprompt

	# remove unused files
	rm -f ${HB_BIN_INSTALL}/{hbdoc,hbtest}
	
	dodoc Changelog COPYING doc/*.txt 
	docinto en
	dodoc doc/en/*.txt
	docinto es
	dodoc doc/es/*.txt
	docinto ct
	dodoc doc/en/ct/*.txt
}
