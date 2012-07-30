# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="FTN-style mailer"
SRC_URI="ftp://happy.kiev.ua/pub/fidosoft/mailer/binkd/binkd098.zip"
HOMEPAGE="http://2f.ru/binkd/"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND=""
DEPEND="app-arch/unzip
        ${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	cp ${S}/mkfls/unix/* ${S}
	}

src_compile() {
	econf || die "configure failed"
	emake || die "make failed"
}

src_install() {
	#make DESTDIR=${D} install || die "install failed"
	dobin binkd
	dodir /etc
	cp binkd.cfg ${D}/etc/
	doman binkd.8
	doins binkd.cfg
	dodoc !README* COPYING
}
