# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
HOMEPAGE="http://www.device-image.de"
DESCRIPTION="Creates Images of blockdevices."
LICENSE="GPLv2"
SRC_URI="http://device-image.de/download/${PN}_src-${PV}.tar.gz"
RSTRICT="nomirror"
KEYWORDS="~x86 ~amd64"
DEPEND="=sys-libs/zlib-1.2.2"
IUSE="static"
src_install() {

	einstall || die

	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README RELEASE TODO

}

