# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools

DESCRIPTION="Fbi IMproved is a framebuffer image viewer based on Fbi and inspired from Vim"
HOMEPAGE="http://savannah.nongnu.org/projects/fbi-improved"
SRC_URI="http://download.savannah.nongnu.org/releases/fbi-improved/${PN}-${PV/_/-}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

IUSE="debug gif jpeg png tiff postscript screen"

RDEPEND="gif? ( media-libs/giflib )
	jpeg? ( >=media-libs/jpeg-6b )
	png? ( media-libs/libpng )
	tiff? ( media-libs/tiff )
	postscript? ( virtual/ghostscript media-libs/tiff )
	screen? ( app-misc/screen )
	sys-libs/readline"

DEPEND="${RDEPEND}
	sys-devel/flex
	sys-devel/bison"

S=${WORKDIR}/${PN}-${PV/_/-}

src_unpack() {
	unpack ${A}
	cd "${S}"
	eautoreconf
}

src_compile() {
	econf \
		$(use_enable debug) \
		$(use_enable gif) \
		$(use_enable jpeg) \
		$(use_enable png) \
		$(use_enable tiff) \
		$(use_enable screen) \
		--enable-fimrc \
		--with-docdir="/usr/share/doc/${PF}"

	# parallel make fails
	emake -j1 || die "emake failed for ${P}"
}

src_install() {
	emake DESTDIR="${D}" prefix=/usr install || die "make install failed"

	if ! use postscript ; then
		rm -f "${D}"/usr/bin/fimgs.sh
	else
		dosym /usr/bin/fimgs.sh /usr/bin/fimgs
	fi
}
