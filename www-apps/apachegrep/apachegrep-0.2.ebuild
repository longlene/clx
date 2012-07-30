# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="apachegrep helps you search your Apache common/combined \
logs for various bits of information."
HOMEPAGE="http://apachegrep.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-www/apache
		app-arch/gzip
		app-arch/bzip2
		dev-lang/perl"

src_install() {
	insinto /usr
	dobin apachegrep
	doman apachegrep.1
	dodoc CHANGELOG LICENSE README TODO
}
