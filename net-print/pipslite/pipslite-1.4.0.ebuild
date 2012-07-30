# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="Drivers for Epson printers"
HOMEPAGE="http://www.avasys.jp/lx-bin2/linux_e/spc/DL1.do"
SRC_URI="pipslite_1.4.0-5.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-print/cups
	x11-libs/gtk+"
RDEPEND="${DEPEND}"
RESTRICT="fetch strip"
MAKEOPTS=-j1

pkg_nofetch() {
	einfo "As avasys removed the direct download link, you need to fetch"
	einfo "the pipslite source from ${HOMEPAGE}"
	einfo "After filling out the questionnaire, download file ${A}"
	einfo "and place it into /usr/portage/distfiles/"
}

src_unpack() {
	unpack ${A}
	cd ${S}
        eautoreconf
}

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"

	cd "${D}"

	doinitd ${FILESDIR}/pipslited

	# make needed symlinks
#	dosym /usr/$(get_libdir)/cups/backend/pipslitelp usr/libexec/cups/backend/pipslitelp
	
	for i in usr/$(get_libdir)/pipslite/* ; do
		dosym /${i} usr/bin/$(echo ${i} | sed -e "s/usr\/$(get_libdir)\/pipslite\///")
	done
	
#	for i in usr/libexec/cups/filter/* ; do
#		dosym /${i} ${i}
#	done
	
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
