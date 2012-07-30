# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="GNU Shishi, a Kerberos 5 Implementation"
HOMEPAGE="http://www.gnu.org/software/shishi"
SRC_URI="ftp://alpha.gnu.org/pub/gnu/shishi/${P}.tar.gz"
EAPI=1

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="gnutls idn ipv6 nls pam +des +des3 +aes +md +null +arcfour"

DEPEND="gnutls? ( net-libs/gnutls )
		idn? ( net-dns/libidn )
		dev-libs/libtasn1
		dev-libs/libgcrypt
		virtual/libiconv
		virtual/libintl"
RDEPEND="${DEPEND}"

src_compile() {
	econf \
		$(use_enable pam) \
		$(use_enable nls) \
		$(use_enable ipv6) \
		$(use_with idn libidn-prefix) \
		$(use_enable gnutls starttls) \
		$(use_enable des) \
		$(use_enable des3) \
		$(use_enable aes) \
		$(use_enable md) \
		$(use_enable null) \
		$(use_enable arcfour) \
		--with-system-asn1 \
		--with-libgcrypt \
		--with-html-dir=/usr/share/doc/${P} \
		--disable-rpath \
		--with-pam-dir=/lib/security \
		${myconf} || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"

	dodoc ABOUT-NLS AUTHORS COPYING ChangeLog INSTALL NEWS README THANKS || \
		die "dodoc failed"
	
	doman doc/man/* doc/*.1 || die "doman failed"

	dohtml doc/reference/html/* || die "dohtml failed"

	doinfo doc/*.info* || die "doinfo failed"
}
