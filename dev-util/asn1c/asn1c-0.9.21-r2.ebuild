# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit versionator

DESCRIPTION="Open Source ASN.1 Compiler."
HOMEPAGE="http://lionet.info/asn1c"
SRC_URI="http://lionet.info/soft/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc"
DEPEND=""
RDEPEND=""

src_install() {
	make DESTDIR="${D}" install \
		|| die "make install failed"
	if use doc; then
		dodoc "${S}/doc/*.{html,pdf}"
	fi
}

