# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils

KEYWORDS="~x86"

MY_P=${P/pdc/PDC}

DESCRIPTION="A public domain curses library for DOS, OS/2, Win32 and X11"
HOMEPAGE="http://pdcurses.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
LICENSE="public-domain GPL-2"
SLOT="0"
IUSE="debug doc examples latin1 nextaw Xaw3d"

DEPEND="x11-libs/libX11
		x11-libs/libXmu
		x11-libs/libXt
		x11-libs/libXpm
		x11-proto/xproto
		nextaw? ( x11-libs/neXtaw )
		Xaw3d? ( x11-libs/Xaw3d )
		!nextaw? ( !Xaw3d? ( x11-libs/libXaw ) )"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	if use Xaw3d && use nextaw ; then
		elog "You have both Xaw3d and nextaw USE-flags set,"
		elog "the package will choose one of them to link against."
	fi
}

src_unpack() {
	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-configure.patch"

	# Fixing -jX problems:
	sed -i \
		-e 's/\(PDCurses.man:\)/\1 manext/' \
		tools/Makefile.in || die "sed failed"

	# Fixing soname problem:
	sed -i \
		-e "s/\(\$(LD_RXLIB1)\)/\1 -Wl,-soname,libXcurses.so.${PV%.*}/" \
		pdcurses/Makefile.in || die "sed failed"

	eautoreconf
}

src_compile() {

	if ! use examples ; then
		sed -i \
			-e 's/\(^all[ \t]::[\t a-z]*\) demos/\1/' \
			-e '/demos/d' \
			Makefile.in || die "sed failed"
	fi

	if ! use doc ; then
		sed -i \
			-e '/tools/d' \
			Makefile.in || die "sed failed"
	fi

	econf \
		$(use_with Xaw3d xaw3d) \
		$(use_with nextaw) \
		$(use_enable debug) \
		$(use_enable latin1) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc HISTORY README TODO doc/*

	if use doc ; then
		dodoc tools/PDCurses.man
	fi
	if use examples ; then
		insinto /usr/share/${PN}/examples
		cd demos
		doins *.{h,c} $(sed -e 's/^DEMOS[ \t]*=\ \(.*\)/\1/p' -e 'd' Makefile.in)
	fi

}
