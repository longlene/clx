# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /usr/local/portage/dev-libs/stringencoders-3.10.3.ebuild,v 1.3 2010/05/28 19:18:00 eva Exp $

EP="${PN}-v${PV}"

SRC_URI="http://${PN}.googlecode.com/files/${EP}.tar.gz"

DESCRIPTION="A collection of high performance c-string transformations, frequently 2x faster than standard implementations."
HOMEPAGE="http://code.google.com/p/stringencoders/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="UrlEncoding debug test"

DEPEND="sys-devel/autoconf"
	
src_compile() {
        cd "${EP}"
	local myconf=""
	use UrlEncoding || myconf="--with-b64wchars='-_.'"
	econf ${myconf} || die
        emake || die
}

src_install() {
        cd "${EP}"
        emake DESTDIR="${D}" install || die
        dodoc AUTHORS ChangeLog NEWS README INSTALL
}
