# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

ESVN_REPO_URI="http://toxygen.net/svn/${PN}/trunk/"

inherit autotools subversion

DESCRIPTION="This library implements the client side of the Gadu-Gadu protocol"
HOMEPAGE="http://toxygen.net/libgadu/"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS=""

IUSE="ssl threads"

DEPEND="ssl? ( >=dev-libs/openssl-0.9.6m )"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--enable-shared \
		$(use_with threads pthread) \
		$(use_with ssl openssl)
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
