# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="gaim-openq is a QQ (oicq) protocol plug-in for Gaim"

HOMEPAGE="http://openq.sourceforge.net"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=net-im/gaim-1.0.0
        >=dev-libs/glib-2.0.0
        >=x11-libs/gtk+-2.0.0"

src_install() {
	make install DESTDIR=${D} || die "install failure"
	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README VERSION
}

