# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Email notifier for terminals"
HOMEPAGE="http://www.infodrom.org/projects/newmail/"
SRC_URI="http://www.infodrom.org/projects/newmail/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dobin newmail
	doman newmail.1
	dodoc AUTHORS README
}
