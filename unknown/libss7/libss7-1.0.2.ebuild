# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-libs/libss7/libss7-1.0.2.ebuild,v 1.0 2010/10/21 08:14:39 chainsaw Exp $

EAPI="3"

EAPI=3
inherit base

DESCRIPTION="Signalling System 7 (SS7) protocol library"
HOMEPAGE="http://www.asterisk.org/"
SRC_URI="http://downloads.asterisk.org/pub/telephony/libss7/releases/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86 ~ppc ~sparc"
IUSE=""

RDEPEND=">=net-misc/dahdi-2.0.0"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc ChangeLog README NEWS* || die "dodoc failed"
}
