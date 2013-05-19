# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Pixel image editor"
HOMEPAGE="http://www.kanzelsberger.com/"
SRC_URI="http://www.kanzelsberger.com/binary/pixeldemo-1.0.${PV}-linux.nosetup.i386.tar.bz2"

LICENSE="pixel"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="cups dcraw lcms scanner spellcheck openexr"

RESTRICT="strip"

RDEPEND="media-libs/freetype
        media-libs/libpng
	media-libs/libsdl
	|| ( (
			x11-libs/libX11
			x11-libs/libXau
			x11-libs/libXdmcp
			x11-libs/libXext
		)
		virtual/x11
	)
	cups? ( net-print/cups )
	dcraw? ( media-gfx/dcraw )
	spellcheck? ( app-text/aspell )
	lcms? ( media-libs/lcms )
	scanner? ( media-gfx/sane-backends )
	openexr? ( media-libs/openexr )"

S=${WORKDIR}

src_install() {
	insinto /opt
	doins -r Pixel

	dodir /opt/bin
	dosym /opt/{Pixel,bin}/pixel
	fperms 755 /opt/Pixel/pixel

	dodir /usr/share/pixmaps
	dosym /opt/Pixel/pixel32.png /usr/share/pixmaps/pixel.png
	make_desktop_entry pixel Pixel pixel.png Graphics
}
