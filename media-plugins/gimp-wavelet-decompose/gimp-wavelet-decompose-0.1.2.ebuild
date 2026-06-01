# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="${PN/gimp-/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Wavelet decompose plug-in for GIMP."
HOMEPAGE="http://registry.gimp.org/node/11742"
SRC_URI="http://registry.gimp.org/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
S="${WORKDIR}/${MY_P}"
KEYWORDS="~amd64 ~x86"

DEPEND="media-gfx/gimp"

src_compile() {
	emake CFLAGS="${CFLAGS} -Wall $( gimptool-2.0 --cflags )"
}

src_install() {
	for i in de ru it pl; do
		dodir "/usr/share/locale/${i}/LC_MESSAGES"
	done
	emake -C po install LOCALEDIR="${D}/usr/share/locale" || die "Install failed"

	exeinto "$( gimptool-2.0 --gimpplugindir )/plug-ins"
	doexe "src/${MY_PN}"

	dodoc AUTHORS ChangeLog COPYING INSTALL README THANKS TRANSLATIONS
}
