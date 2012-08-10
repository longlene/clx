# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="TCP port forwarder (and traffic spy)"
HOMEPAGE="http://www.vakuumverpackt.de/tcptunnel/"
SRC_URI="http://www.vakuumverpackt.de/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#DEPEND
#RDEPEND

src_install() {
	emake BINDIR="${D}"/usr STRIP=/bin/true install || die
	dodoc README AUTHORS || die
}
