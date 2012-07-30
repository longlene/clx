# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="rbmake converts to and from rocket ebook format"
HOMEPAGE="http://rbmake.sourceforge.net/"
SRC_URI="mirror://sourceforge/rbmake/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~ppc"
IUSE=""
RDEPEND=">=dev-libs/libxml2-2.3.1
	 >=net-libs/libwww-5.4.0
	 >=dev-libs/libpcre-6.1"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}