# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Pidgin plugin to performs itself like an answering machine or, more likely, a prompter robot"
HOMEPAGE="http://pidgin-autoansw.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN/er/}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-im/pidgin[gtk]"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/lib/pidgin
	doins autoansw.so || die
	dodoc TODO ChangeLog README || die
}
