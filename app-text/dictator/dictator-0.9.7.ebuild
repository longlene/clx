# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/dictator/latest/scripts/templates/dictator.ebuild,v 1.2 2005/08/01 22:43:26 kmh1979 Exp $

inherit distutils

DESCRIPTION="On-screen text file reader employing Rapid Serial Visual Presentation."
SRC_URI="mirror://sourceforge/dictator/${P}.tar.gz"
HOMEPAGE="http://dictator.kieranholland.com/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/python
		>=x11-libs/gtk+-2.4
		>=dev-lang/python-2.2
		>=dev-python/wxpython-2.4.2.4"

src_install() {
	distutils_src_install
	dodoc doc/*
	cd ${D}/usr/bin
	dosym dictator_start.py /usr/bin/dictator
}
