# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Drivers for Epson printers"
HOMEPAGE="http://www.avasys.jp/english/"
SRC_URI="http://lx2.avasys.jp/pips/lite${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-print/cups"
RDEPEND="$DEPEND"

#src_unpack() {
#        unpack ${A}
#}

src_compile() {
	econf \
		--bindir=/bin \
		|| die "could not configure"
	emake || die "emake failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"
	dodoc NEWS README* AUTHORS ChangeLog

	cd ${D}

	#Copied from mattia's post at http://forums.gentoo.org/viewtopic-t-650480.html
	doinitd ${FILESDIR}/ekpd

	dobin bin/*
	rm -rf bin

	dodoc usr/share/pipslite/readme/*
	rm -rf usr/share/pipslite/readme

	insinto /usr/libexec/cups/filter
	doins usr/lib/cups/filter/*

	insinto /usr/libexec/cups/backend
	doins usr/lib/cups/backend/ekplp

	rm -rf usr/lib
}

pkg_postinst() {
	einfo "To install a ppd file for your printer, run"
	einfo "     /etc/init.d/ekpd start"
	einfo "     pipslite-install"
}
