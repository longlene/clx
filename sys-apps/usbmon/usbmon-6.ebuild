# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/usbmon/usbmon-6.ebuild,v 1.3 2011/08/03 03:55:42 gibboris Exp $

DESCRIPTION="Userland for USB monitoring framework"
HOMEPAGE="http://people.redhat.com/zaitcev/linux/"
SRC_URI="${HOMEPAGE}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc ~amd64"
IUSE=""

src_install() {
	dosbin usbmon
	doman usbmon.8
}
