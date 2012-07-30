# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit base

DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="http://www.diku.dk/hjemmesider/ansatte/panic/P-touch/"
SRC_URI="http://www.diku.dk/hjemmesider/ansatte/panic/P-touch/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="net-print/foomatic-db"
RDEPEND="${DEPEND}"
#S="${WORKDIR}/${P}"

src_install() {
	einstall || die
	dosym /usr/lib/cups/filter/rastertoptch /usr/bin/ || die
}
