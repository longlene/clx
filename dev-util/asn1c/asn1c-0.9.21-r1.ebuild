# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="ASN.1 to C compiler"
HOMEPAGE="http://asn1c.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install(){
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc BUGS FAQ NEWS README TODO || die "dodoc failed"
}
