# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="patched version of GNU dd to include a number of features useful for computer forensics"
HOMEPAGE="http://dc3dd.sourceforge.net/"
SRC_URI="mirror://sourceforge/dc3dd/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="nls"

RDEPEND=""
DEPEND="nls? ( sys-devel/gettext )"

src_configure() {
	econf \
		$(use_enable nls)
}

src_install() {
	make install DESTDIR="${D}" || \
		die "make install failed"
	dodoc AUTHORS ChangeLog README NEWS THANKS-to-translators THANKS || \
		die "dodoc failed"
}
