# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic


MY_PV=`echo ${PV} |sed s/_/\./g`
MY_P="${PN}-${MY_PV}"

		
IUSE=""
DESCRIPTION="Sane driver for primax scanners"
HOMEPAGE="http://px-backend.sourceforge.net/"

DEPEND=">=sys-libs/libieee1284-0.2.8
		media-gfx/sane-backends
		media-libs/tiff"

SRC_URI="http://ovh.dl.sourceforge.net/sourceforge/px-backend/${MY_P}.tar.gz
		 http://jaist.dl.sourceforge.net/sourceforge/px-backend/${MY_P}.tar.gz
		 http://easynews.dl.sourceforge.net/sourceforge/px-backend/${MY_P}.tar.gz
		 http://ufpr.dl.sourceforge.net/sourceforge/px-backend/${MY_P}.tar.gz
		"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
S="${WORKDIR}/${MY_P}"

src_compile() {
	if use amd64; then
		append-flags -fPIC
	fi

	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
	|| die
	emake || die
}

src_install () {
	into /usr
	dobin primax_scan
	insinto /usr/lib/sane/
	doins .libs/libsane-primax.a
	doins .libs/libsane-primax.la
	doins .libs/libsane-primax.so.1.0.0
	dosym /usr/lib/sane/libsane-primax.so.1.0.0 /usr/lib/sane/libsane-primax.so.1
	dosym /usr/lib/sane/libsane-primax.so.1.0.0 /usr/lib/sane/libsane-primax.so
}

pkg_postinst() {
	einfo
	einfo "If it's a new install, Add 'primax' in '/etc/sane.d/dll.conf'"
	einfo "echo primax >> /etc/sane.d/dll.conf"
	einfo
	einfo "You must set the parallel port to EPP mode in your bios"
	einfo "to make the scanner work reliably"
	einfo
	einfo "Also, be sure that 'IEEE 1284 transfer modes' is enabled in the section "
	einfo "'Device Drivers->Parallel port support' of your kernel"
	einfo
}
