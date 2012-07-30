# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils pam toolchain-funcs autotools autotools-utils

DESCRIPTION="Low level library functions for Zorp"
HOMEPAGE="http://www.balabit.com/network-security/zorp-gpl/overview"
SRC_URI="http://www.balabit.com/downloads/files?path=/zorp/3.3R6/source/libzorpll_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+caps ssl debug"

DEPEND="caps? ( >=sys-libs/libcap-2.16 )
	ssl? ( dev-libs/openssl )
	>dev-libs/glib-2.20.0
"

RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
            $(use_enable debug) \
            $(use_enable ssl ssl-engine)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
