# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Program which locks your keyboard but leaves your mouse free."
HOMEPAGE="http://csincock.customer.netspace.net.au/lock-keyboard-for-baby.htm"
SRC_URI="http://csincock.customer.netspace.net.au/download/lock-keyboard-for-baby-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/gtk2-perl"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}/lock-keyboard-for-baby-${PV}" "${S}/${PN}"
}

src_install() {
	dobin ${PN}
}
