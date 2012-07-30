# Copyright 2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A system baselining and evidence collection tool"
HOMEPAGE="http://ftimes.sourceforge.net/FTimes/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tgz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="ssl static"

DEPEND="ssl? ( >=dev-libs/openssl-0.9.7d )"

src_compile() {
	use static && sed -i -e "s/^FTIMES_LFLAGS.*/& -static/" ${S}/src/Makefile.in
	
	local myconf
	use ssl || myconf="--without-ssl"
	
	econf --sysconfdir=/etc/ftimes ${myconf} || die "./configure failed"

	emake || die "emake failed"
}

src_install() {
	einstall etcdir=${D}/etc/ftimes || die "install failed"
}

