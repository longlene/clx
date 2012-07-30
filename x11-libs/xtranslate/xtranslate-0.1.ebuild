# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="Translate X11 selection to other langauges"
HOMEPAGE="http://xtranslate.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 ia64 ppc x86"
IUSE=""

RDEPEND="|| ( (
		x11-libs/libX11
		x11-libs/libXmu )
	virtual/x11 )"
DEPEND="${RDEPEND}
	|| ( ( x11-proto/xproto )
		virtual/x11 )"

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install () {
	make DESTDIR=${D} install || die "installation failed"
	dodoc README CHANGES xtranslaterc
	dobin xtranslate
	insinto /etc
	doins xtranslaterc
}

pkg_postinst() {
		einfo "an rc file has been placed at /etc/xtranslaterc"
		einfo "please copy it into ~/.xtranslaterc or provide"
		einfo "an rc file to xtranslate with the -c option."
		einfo ""
		einfo "if you created a new xtranslaterc file for a new"
		einfo "language, please send it to tzachar@cs.bgu.ac.il"
}

