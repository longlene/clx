# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

#inherit base versionator fixheadtails eutils
inherit eutils

DESCRIPTION="Epson Avasys driver for CX11 with the Cups-printing system."
HOMEPAGE="http://www.avasys.jp/english/linux_e/dl_mfp.html"
SRC_URI="http://lx1.avasys.jp/lpf/alcx11.1/Epson-ALCX11-filter-1.1.tar.gz"
LICENSE="EPSON AVASYS Public License"
SLOT="0"
KEYWORDS="x86"

DEPEND="app-text/psutils
	sys-libs/glibc
	sys-apps/sed
	sys-apps/grep
	sys-apps/gawk
	sys-devel/bc
	>=net-print/cups-1.1.17
        >=net-print/foomatic-filters-3.0"

src_unpack() {
	unpack Epson-ALCX11-filter-1.1.tar.gz
}

src_compile() {
	echo "There is nothing to compile."
}

src_install() {
	cd ${WORKDIR}/Epson-ALCX11-filter-1.1
	dobin pstoalcx11.sh
	dobin alcx11
	cd ppd
	insinto /usr/share/cups/model
	doins Epson-AL-CX11-fm3.ppd
}

pkg_postinst() {
	einfo "Now you can setup the printer in your cups-settings."
}
