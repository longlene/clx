# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Python-framework for Courier-MTA's courierfilter"
HOMEPAGE="http://phantom.dragonsdawn.net/~gordon/courier-patches/courier-pythonfilter/"
SRC_URI="http://phantom.dragonsdawn.net/~gordon/courier-patches/courier-pythonfilter/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="mail-mta/courier
	dev-lang/python"

src_install() {
	distutils_src_install

	keepdir /var/state/pythonfilter
	chown daemon:daemon ${D}/var/state/pythonfilter

	dosym /usr/bin/pythonfilter /usr/lib/courier/filters/pythonfilter
}
