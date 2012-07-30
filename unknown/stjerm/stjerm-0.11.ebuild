# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit autotools eutils

DESCRIPTION="A drop down terminal, similar to the consoles found in first person shooters"
HOMEPAGE="http://download.gna.org/stjerm/"
SRC_URI="http://download.gna.org/stjerm/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-libs/vte
	dev-util/pkgconfig
	>x11-libs/gtk+-2.6"

src_unpack() {
	unpack ${A} ; cd ${S}
	eaclocal  || die "aclocal failed"
	eautoheader || die "autoheader failed"
	#eautomake --add-missing --copy || die "automake failed"
	eautoconf || die "autoconf faild"
	eautomake || die "automake failed"

}

src_compile() {
	econf --prefix=/usr/ || die "configure faild"
	emake || die "make failed"
}


src_install() {
	make DESTDIR="${D}" install || die "make install failed"
}
