# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit eutils

DESCRIPTION="GNU common networking utilities and servers"
HOMEPAGE="https://www.gnu.org/software/inetutils/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ipv6 ncurses pam shishi tcpd"

DEPEND="ncurses? ( sys-libs/ncurses )
		pam? ( virtual/pam )
		shishi? ( app-crypt/shishi )
		tcpd? ( sys-apps/tcp-wrappers )"
RDEPEND="${DEPEND}
		 pam? ( sys-auth/pambase )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-no-gets.patch #424978
}

src_configure() {
	# --disable-encryption : no encryption without shishi
	# --disable-hostname   : sys-apps/net-tools
	# --disable-ifconfig   : sys-apps/net-tools
	# --disable-logger     : sys-apps/util-linux
	# --disable-tftpd      : net-misc/iputils

	econf \
		--without-krb4 \
		--without-krb5 \
		--disable-encryption \
		--disable-hostname \
		--disable-ifconfig \
		--disable-logger \
		--disable-tftpd \
		$(use_enable ipv6) \
		$(use_enable ncurses) \
		$(use_with pam) \
		$(use_with shishi) \
		$(use_with tcpd wrap)
}
