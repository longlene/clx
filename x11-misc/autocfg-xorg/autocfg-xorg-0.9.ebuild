# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="autocfg-xorg is a tool which detects hardware and generates xorg.conf"
HOMEPAGE="ftp://ftp.berlios.de/pub/vinque/"
SRC_URI="ftp://ftp.berlios.de/pub/vinque/${P}.tgz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="-amd64"
IUSE=""
RDEPEND="dev-lang/python
		sys-apps/ddcxinfo-knoppix
		sys-apps/pciutils"

src_install() {
	newsbin autocfg-xorg.py autocfg-xorg
	dodoc README
}
