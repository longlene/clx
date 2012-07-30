# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/xpaint/xpaint-2.7.7.ebuild,v 1.2 2006/02/04 09:51:53 nelchael Exp $

inherit eutils

DESCRIPTION="XPaint is an image editor which supports most standard paint program options."
HOMEPAGE="http://sf-xpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/sf-xpaint/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="Xaw3d jpeg tiff png doc debug"

DEPEND="x11-misc/imake
	x11-misc/gccmakedep
	app-text/rman 
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXt
	x11-libs/libXmu
	x11-libs/libSM
	x11-libs/libICE
	x11-libs/libXp
	x11-libs/libXpm
	>=media-libs/tiff-3.2
	>=media-libs/jpeg-6
	>=media-libs/libpng-1.0.8
	sys-devel/bison
	sys-devel/flex
	Xaw3d? ( x11-libs/Xaw3d )
	!Xaw3d? ( x11-libs/libXaw )"

src_compile() {
	
	sed -i 's/configure xaw3d/configure XAW3D/' Imakefile

	if ! use png; then 
		sed -i 's/#define HavePNG/#undef HavePNG/' Local.config
	fi
	if ! use tiff; then
		sed -i 's/#define HaveTIFF/#undef HaveTIFF/' Local.config
	fi
	if ! use jpeg; then
		sed -i 's/#define HaveJPEG/#undef HaveJPEG/' Local.config
	fi
	if use debug; then
		echo 'CDEBUGFLAGS = -g' >> Local.config
	fi

	xmkmf || die

	if use Xaw3d; then
		make xaw3d || die
	else
		make xaw || die
	fi
}

src_install() {
	make DESTDIR=${D} install || die
	if use doc; then
		make DESTDIR=${D} install.man || die
	fi
}
