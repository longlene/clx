# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="a tool for running processes with a different clock setting"
HOMEPAGE="http://www.hornby.dsl.pipex.com/dateshift/"
SRC_URI="http://www.hornby.dsl.pipex.com/dateshift/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS README
}
