# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Vodafone Mobile Connect Card driver for Linux"
HOMEPAGE="https://forge.betavine.net/projects/vodafonemobilec/"
SRC_URI="https://forge.betavine.net/frs/download.php/421/${PN}_1.99.17-8_all.deb"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/python:2.5
	dev-python/twisted
	dev-python/twisted-conch
	dev-python/pyserial
	dev-python/pytz
	net-dialup/wvdial
	sys-apps/usb_modeswitch"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary
	chmod a+x usr/bin/vmc-cli-client.py
}

src_install() {
	cp -a * "${D}"/ || die "installing failed"
}
