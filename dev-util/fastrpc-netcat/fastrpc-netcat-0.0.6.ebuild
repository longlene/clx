# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="XML-RCP/FastRPC interactive console client"
HOMEPAGE="http://fastrpc-netcat.sf.net/"
SRC_URI="http://internap.dl.sourceforge.net/sourceforge/${PN}/${PN}_${PV}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/python"

S="${WORKDIR}/${PN}_${PV}"

src_install() {
	dobin fastrpc-netcat

	doman fastrpc-netcat.1

	dodoc COPYING
}
