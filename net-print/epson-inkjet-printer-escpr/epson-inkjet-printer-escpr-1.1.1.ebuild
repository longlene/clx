# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools

MY_P="${P}-1lsb3.2"

DESCRIPTION="Epson Inkjet Printer Driver (ESC/P-R) for Linux" # common Linux printer driver
HOMEPAGE="http://avasys.jp/eng/linux_driver/download/lsb/epson-inkjet/escpr/"
SRC_URI="http://linux.avasys.jp/drivers/lsb/epson-inkjet/escpr/src/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}


