# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

inherit eutils

DESCRIPTION="Mark Tyler's painting program"
HOMEPAGE="http://mtpaint.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="gif jpeg tiff"

RDEPEND=">=media-libs/libpng-1.2.7
>=sys-devel/gettext-0.14.1
>=dev-libs/glib-2.6.4
>=x11-libs/gtk+-2.6.4
>=x11-libs/pango-1.9.0
>=dev-libs/atk-1.9.0
media-libs/freetype
gif? ( >=media-libs/giflib-4.1.4 )
jpeg? ( >=media-libs/jpeg-6b media-libs/openjpeg )
tiff? ( >=media-libs/tiff-3.6.1 )"

DEPEND="${RDEPEND} dev-util/pkgconfig"

src_compile() {
	local myconf="${myconf} --prefix=/usr \
		intl --locale=/usr/share/locale \
		man --mandir=/usr/share/man/man1 \
		gtk2 ft"

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
	mkdir -p "${D}"/usr/share/pixmaps
	cp src/icons1/icon.xpm "${D}"/usr/share/pixmaps/mtpaint.xpm

	make DESTDIR=${D} install || die "einstall failed"
}
