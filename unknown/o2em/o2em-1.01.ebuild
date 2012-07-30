# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="O2EM is a freeware open source multi-platform Odyssey2 / Videopac+ emulator. The Odyssey2 (Videopac/Jopac in Europe) was a video game console created in the late 70s."
HOMEPAGE="http://o2em.sourceforge.net/"
SRC_URI="mirror://sourceforge/o2em/O2EM101-src.zip"

LICENSE="Artistic License"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="media-libs/allegro"

S="${WORKDIR}/O2EM101-src"

src_compile () {
	if has_version =media-libs/allegro-4.0* ; then
		sed -ie 's%\(/usr\)/local\(/lib/liballeg.so.\)%\1\2%' Makefile.linux
	elif has_version =media-libs/allegro-4.1* ; then
		sed -ie 's%\(/usr\)/local\(/lib/liballeg.so.\)4.0%\1\24.1%' Makefile.linux
	else
		die "incompatible allegro"
	fi
	make -f Makefile.linux || die "make failed"
}

src_install () {
	exeinto /usr/bin
	doexe o2em dis48 || die
	dodoc O2EM.txt Readme_1st.txt || die
}

