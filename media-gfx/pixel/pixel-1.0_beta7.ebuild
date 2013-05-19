# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Pixel image editor"
HOMEPAGE="http://www.kanzelsberger.com/"
MY_PN="${PN/-/}"
MY_P="${MY_PN}-${PV}"
SRC_URI="x86? ( ${MY_P/_beta7/.699}-linux.x86.tar.bz2 )
	amd64? ( ${MY_P/_beta7/.699}-linux.x86-64cmpt.tar.bz2 )"

LICENSE="pixel"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="cups dcraw lcms scanner spell openexr"
RESTRICT="fetch strip"

DEPEND="!media-gfx/pixel-demo"

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

pkg_nofetch() {
	echo
	einfo "Login to:"
	einfo "http://www.kanzelsberger.com/members"
	einfo "to obtain binary package"
	ewarn "this ebuild if for build 699"
	ewarn "For x86 64bit, download:"
	ewarn "Pixel 1.0 Beta 7 699 x86-64cmpt Linux 2007-09-15"
	ewarn "Pixel beta7 for Linux x86 is considered non-released non-finished by upstream"
	ewarn "As per instruction on "
	ewarn "http://www.pixelcommunity.com/forum/viewtopic.php?f=9&t=76&sid=81f9c6f7270c103b2f6c672fc7cd42ac"
	ewarn "To get unoficial x86 beta_7 click on download link for"
	ewarn "Pixel 1.0 Beta 6 576 x86 Linux 2006-11-28 and"
	ewarn "then scroll down to:"
	ewarn "Notice: If you're interested in non-released non-finished"
	ewarn "Beta7 for Linux, its snapshot is available here."
	ewarn "and download pixel-1.0.699-linux.x86.tar.bz2"
	einfo "place downloaded files in /usr/portage/distfiles"
	echo
}

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

pkg_postinst() {
	echo
	einfo "Upstream provides the following warning:"
	echo
	ewarn "Pixel beta7 for Linux x86 is considered non-released non-finished by upstream"
	echo
	ewarn "If you're upgrading from older version it is recommended to delete"
	ewarn "configuration file from ~/.pixel/linux.ini as it might be missing "
	ewarn "new configuration entries."
	echo
}
