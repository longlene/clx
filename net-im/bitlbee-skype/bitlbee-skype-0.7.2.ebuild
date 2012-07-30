# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

DESCRIPTION="Skype plugin for Bitlbee"
HOMEPAGE="http://vmiklos.hu/project/bitlbee-skype/"
SRC_URI="http://vmiklos.hu/project/bitlbee-skype/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# NOTE: These USE-flags control only dependencies, the presence of the
# required files is autodetected and skyped daemon and/or bitlbee
# plugin are built accordingly.
IUSE="daemon plugin"
DEPEND="daemon? ( >=net-im/skype-1.4.0.99
		>=dev-python/skype4py-0.9.28.7
		>=dev-python/pygobject-2.8.0
		dev-python/python-gnutls )
	plugin? ( >=net-im/bitlbee-1.2.3 )"

src_install() {
	emake DESTDIR=${D} install
	dodoc Changelog NEWS README
}

pkg_postinst() {
	einfo
	elog "For basic configuration, please refer to the chapter 3.4"
	elog "in the project homepage:"
	elog "${HOMEPAGE}#_configuring"
	einfo
}