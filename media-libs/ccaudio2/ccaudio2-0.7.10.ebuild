# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="a C++ class framework for processing audio files."
HOMEPAGE="http://www.gnu.org/software/bayonne/bayonne.html"
SRC_URI="mirror://sourceforge/gnutelephony/${PF}.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86"
IUSE="gsm"

DEPEND="gsm? ( media-sound/gsm )"
		
src_install () {
	make DESTDIR=${D} install
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO
	dohtml -r doc/html/*
}
