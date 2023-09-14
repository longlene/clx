# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A tool for working with sets of shn and flac audio files"
HOMEPAGE="http://freeengineer.org/shn2make.html"
SRC_URI="ftp://ftp.freeengineer.org/pub/shn2make/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-devel/make"
RDEPEND="media-sound/vorbis-tools
         dev-lang/perl
         sys-devel/make
         media-sound/shntool
         app-cdr/cdrtools
         media-libs/flac
         media-sound/lame
         media-sound/bladeenc"

src_install() {
	dodoc README ChangeLog shn2makerc_proto || die
	dodir /usr/man/man1 || die
	make PREFIX="${D}"/usr install || die
}
