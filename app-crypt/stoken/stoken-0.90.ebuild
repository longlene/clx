# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Software Token for Linux/UNIX"
HOMEPAGE="http://stoken.sf.net"
SRC_URI="https://github.com/cernekee/stoken/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="gtk3"

DEPEND="
|| ( dev-libs/nettle dev-libs/libtomcrypt )
dev-libs/libxml2
gtk3? ( x11-libs/gtk+:3 )
"
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh
	econf --prefix=/usr \
		$(use_with gtk3 gtk)
}
