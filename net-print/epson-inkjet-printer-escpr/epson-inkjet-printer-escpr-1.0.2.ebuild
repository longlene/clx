# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit rpm autotools base

DESCRIPTION="Epson Inkjet Printer Driver (ESC/P-R), supports various pinters"
HOMEPAGE="http://avasys.jp/eng/linux_driver/download/lsb/epson-inkjet/escpr/"
SRC_URI="http://linux.avasys.jp/drivers/lsb/epson-inkjet/stable/SRPMS/${P}-1lsb3.2.src.rpm"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

src_unpack() {
	rpm_src_unpack
}

src_prepare() {
	sed -i -e 's:/opt/lsb/:/usr/:g' configure.ac || die
	eautoreconf
}

src_compile() {
	emake -j1 || die
}
