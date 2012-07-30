# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Free, open source compiler of ASN.1 specifications into C source code."
HOMEPAGE="http://lionet.info/asn1c/"
SRC_URI="http://lionet.info/soft/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~alpha ~ppc ~sparc"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	DESTDIR=${D} emake install || die "emake install failed"
	
	# Upstream creates its own ${D}/usr/share/doc/asn1c directory; get rid of it
	mv "${D}/usr/share/doc/${PN}" "${D}/usr/share/doc/${PF}"
	prepalldocs
}

