# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="PIC Microcontroller Programming using the MPLAB ICD2 with Linux"
HOMEPAGE="http://www.hcilab.org/resources/particles/particles-linux-mplab-howto.htm"
SRC_URI="http://www.hcilab.org/resources/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="usb"

DEPEND="
	usb?	( dev-libs/libusb )"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	dodoc README AUTHORS
}
