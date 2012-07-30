# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="An IP Video security assessment tool"
HOMEPAGE="http://videojak.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug ncurses pcre ssl"

DEPEND="net-libs/libpcap
	net-libs/libnet
	media-libs/alsa-lib
	ncurses? ( sys-libs/ncurses )
	pcre? ( dev-libs/libpcre )
	ssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -e 's#cp \*.ffpreset /usr/local#cp \*.ffpreset $(DESTDIR)/usr#' \
		-i conf/Makefile || die "sed failed"
}

src_configure() {
	econf $(use_with ssl openssl /usr) \
		$(use_with pcre libpcre /usr) \
		$(use_with iconv iconv /usr) \
		$(use_with ncurses libncurses /usr) \
		$(use_enable debug)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
