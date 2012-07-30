# Copyright 2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1
inherit eutils

DESCRIPTION="Library for working with MIME messages and Internet messaging services like IMAP, POP or SMTP"
HOMEPAGE="http://www.vmime.org"
SRC_URI="mirror://sourceforge/vmime/${P}.tar.bz2"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE="debug doc examples +gnutls +imap +maildir +pop +sasl +sendmail +smtp"

DEPEND="virtual/libiconv
        gnutls? ( >=net-libs/gnutls-1.2.0 )
        sasl? ( || ( net-libs/libgsasl net-misc/gsasl ) )
        sendmail? ( mail-mta/ssmtp )
        doc? ( app-doc/doxygen )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i \
		-e "s|doc/\${PACKAGE_TARNAME}|doc/${PF}|" \
		-e "s|doc/\$(GENERIC_LIBRARY_NAME)|doc/${PF}|" \
		configure Makefile.in || die "sed failed"

	epatch "${FILESDIR}/libvmime-${PV}-gcc4_4.patch"
}

src_compile() {
	econf $(use_enable debug) \
          $(use_enable sasl) \
          $(use_enable gnutls tls) \
          $(use_enable pop messaging-proto-pop3) \
          $(use_enable smtp messaging-proto-smtp) \
          $(use_enable imap messaging-proto-imap) \
          $(use_enable maildir messaging-proto-maildir) \
          $(use_enable sendmail messaging-proto-sendmail) \
		|| die "econf failed"
	emake || die "emake failed"
	if use doc; then
		doxygen vmime.doxygen || "doxygen failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "email install failed"
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README
	if use doc; then
		dohtml doc/html/*
	fi

	insinto /usr/share/doc/${PF}
	use examples && doins -r examples
}
