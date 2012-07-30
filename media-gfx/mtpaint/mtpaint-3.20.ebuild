# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Simple gtk+ painting program"
HOMEPAGE="http://mtpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="gif gtk2 jpeg tiff"

RDEPEND="
	>=sys-libs/zlib-1.2.1
	>=media-libs/libpng-1.2.7
	>=sys-devel/gettext-0.14.1

	gtk2? (
		>=dev-libs/glib-2.6.4
		>=x11-libs/gtk+-2.6.4
		>=x11-libs/pango-1.9.0
		>=dev-libs/atk-1.9.0
	)
	!gtk2? (
		>=dev-libs/glib-1.2.10
		>=x11-libs/gtk+-1.2.10
		media-libs/imlib
	)
	gif? ( >=media-libs/giflib-4.1.4 )
	jpeg? ( >=media-libs/jpeg-6b )
	tiff? ( >=media-libs/tiff-3.6.1 )"

DEPEND="${RDEPEND} dev-util/pkgconfig"

src_compile() {
	local myconf res conffile

	# set paths with DESTDIR for make
	myconf="${myconf} --prefix=\$(DESTDIR)/usr"
	myconf="${myconf} intl --locale=\$(DESTDIR)/usr/share/locale"
	myconf="${myconf} man --mandir=\$(DESTDIR)/usr/share/man/man1"

	use gtk2 && myconf="${myconf} gtk2" || myconf="${myconf} gtk"
	use gif && myconf="${myconf} GIF" || myconf="${myconf} nogif"
	use jpeg  && myconf="${myconf} jpeg" || myconf="${myconf} nojpeg"
	use tiff  && myconf="${myconf} tiff" || myconf="${myconf} notiff"

	# use CFLAGS environment variable and linker optimizations
	myconf="${myconf} asneeded cflags"

	# run configure
	sh configure ${myconf} || die "configure failed"
	emake || die "emake failed"
}

src_install() {
	# create desktop entry
	mkdir -p "${D}"/usr/share/pixmaps
	cp src/icons1/icon.xpm "${D}"/usr/share/pixmaps/mtpaint.xpm
	make_desktop_entry mtpaint "mtPaint" mtpaint Graphics

	make DESTDIR=${D} install || die "einstall failed"
}

