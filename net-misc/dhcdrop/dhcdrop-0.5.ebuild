# Copyright Chebotarev Roman
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Effectively suppresses illegal DHCP servers on the LAN"
HOMEPAGE="http://www.netpatch.ru/dhcdrop.html"
SRC_URI="http://www.netpatch.ru/projects/dhcdrop/${P}.tar.bz2"
KEYWORDS="-* ~amd64"
SLOT="0"
LICENSE="GPL-2"
IUSE="static"

src_unpack () {
	unpack ${A}
}

src_configure () {
	local conf

	if use static; then
		conf="--enable-static-build"
	else
		conf=""
	fi

	econf ${conf} || die "econf failed"
}

src_compile () {
	emake || die "emake failed"
}

src_install () {
	einstall || die "einstall failed"
}
