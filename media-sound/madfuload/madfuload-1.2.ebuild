# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit linux-info eutils autotools

DESCRIPTION="M-Audio DFU firmware loader for MobilePre, Ozone, Sonica and Transit USB
audio interfaces"
HOMEPAGE="http://usb-midi-fw.sourceforge.net/"
SRC_URI="mirror://sourceforge/usb-midi-fw/${P}.tar.gz"

LICENSE="madfuload"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-apps/gawk
	sys-devel/autoconf
	sys-devel/automake"
RDEPEND=">=sys-fs/udev-057"

pkg_setup() {
	linux-info_pkg_setup
}

src_unpack() {
        unpack ${A}
        cd "${S}"
        epatch "${FILESDIR}/configure.ac.patch" || die "configure.ac.patch failed"
	epatch "${FILESDIR}/fix-64-bit-implicit-declarations.patch" || die "64bit fix patch failed"
	epatch "${FILESDIR}/42-madfuload-rules.patch" || die "rules patch failed"
	eautoreconf	
}

src_compile() {
	if ! kernel_is ge 2 6 8 ; then
		die "Kernel >= 2.6.8 needed.";
	fi
	econf
	emake
}

src_install() {
	make DESTDIR="${D}" install
	dodoc README
}

pkg_postinst() {
	einfo "You need to reload udev rules before connecting the device:"
	einfo "# udevadm control --reload-rules"
}
