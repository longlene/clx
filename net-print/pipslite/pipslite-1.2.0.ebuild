# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Drivers for Epson printers"
HOMEPAGE="http://www.avasys.jp/english/"
SRC_URI="http://turnbull.sk.tsukuba.ac.jp/pipslite_1.2.0-0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-print/cups
	x11-libs/gtk+"
RDEPEND="${DEPEND}"
RESTRICT=strip

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}/fix-pixbuf.patch"
	epatch "${FILESDIR}/fix-str_extract.patch"
        eautoreconf
}

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"
	dodoc NEWS README* AUTHORS ChangeLog

	cd "${D}"

	doinitd ${FILESDIR}/pipslited

	dodoc usr/share/pipslite/readme/*
	rm -rf usr/share/pipslite/readme

	make needed symlinks
	dosym /usr/$(get_libdir)/cups/backend/ekplp usr/libexec/cups/backend/ekplp
	
	for i in usr/$(get_libdir)/pipslite/* ; do
		dosym /${i} usr/bin/$(echo ${i} | sed -e "s/usr\/$(get_libdir)\/pipslite\///")
	done
	
	for i in usr/$(get_libdir)/cups/filter/* ; do
		dosym /${i} usr/libexec/cups/filter/$(echo ${i} | sed -e "s/usr\/$(get_libdir)\/cups\/filter\///")
	done
	
	# remove init scripts for other distros
	rm -rf usr/share/pipslite/rc.d
	
	# remove useless
	rm -rf var
}

pkg_postinst() {
	einfo "To install a ppd file for your printer, run"
	einfo "     /etc/init.d/pipslited start"
	einfo "     pipslite-install"
}
