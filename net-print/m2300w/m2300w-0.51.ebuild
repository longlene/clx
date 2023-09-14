# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="The m2300w driver is an open source Linux driver for the Konica Minolta magicolor 2300W and 2400W color laser printers."
HOMEPAGE="http://sourceforge.net/projects/m2300w/"
SRC_URI="http://switch.dl.sourceforge.net/sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="net-print/foomatic
		net-print/cups"
RDEPEND=""

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make INSTROOT=${D} install || die "make failed"
}

