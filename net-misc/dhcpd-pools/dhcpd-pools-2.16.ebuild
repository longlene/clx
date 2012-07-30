# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="ISC dhcp shared network and pool range usage analysis"
HOMEPAGE="http://dhcpd-pools.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --with-dhcpd-conf=${EPREFIX}/etc/dhcp/dhcpd.conf --with-dhcpd-leases=${EPREFIX}/var/lib/dhcp/dhcpd.leases
}


