# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/liba53/liba53-9999.ebuild,v 1.1 2014/04/26 21:39:48 zx2c4 Exp $

EAPI=5

DESCRIPTION="A5/3 Call encryption library"
HOMEPAGE="https://github.com/RangeNetworks/liba53"
SRC_URI="mirror://github/RangeNetworks/liba53/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${D}/usr/lib" "${D}/usr/include"
	default
}
