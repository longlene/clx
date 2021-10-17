# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="a library for the creation of embedded web servers"
HOMEPAGE="http://www.hughes.com.au/products/libhttpd/"
SRC_URI="http://www.hughes.com.au/products/libhttpd/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a src/libhttpd.a
	insinto /usr/include
	doins src/httpd.h
	dodoc README
}
