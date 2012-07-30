# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="GOPchop is a tool for losslessly cutting and merging hardware-encoded MPEG2 video files"

HOMEPAGE="http://gopchop.sourceforge.net/"
SRC_URI="mirror://sourceforge/gopchop/${P}.tar.gz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="sdl"

DEPEND=">=media-libs/libmpeg2-0.4.0
		sdl? ( media-libs/libsdl )
		=x11-libs/gtk+-1.2*"

src_compile() {
	econf $(use_enable sdl) --with-x || die "econf failed"
	emake prefix="/usr" || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die

	# Fixup images so the app can find them
	mv ${D}/usr/share/pixmaps/gopchop/* \
		${D}/usr/share/pixmaps/ -v || die
	rm -rf ${D}/usr/share/pixmaps/gopchop
	
	dodoc README COPYING ChangeLog AUTHORS TODO
	make_desktop_entry gopchop "GOPchop" gopchop.png AudioVideo
}
