# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="a latin date(1)"
HOMEPAGE="http://hodie.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_install() {
	dobin hodie
	doman hodie.1
	dodoc README BUGS CREDITS CHANGELOG TODO DISTRIBUTORS
}
