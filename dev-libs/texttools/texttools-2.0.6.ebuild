# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Ncurses-based library for window creation and event handling."
HOMEPAGE="http://www.pegasoft.ca/tt.html"
SRC_URI="http://www.pegasoft.ca/downloads/${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-libs/ncurses-5.0
	virtual/ada
	virtual/gnat"
RDEPEND="${DEPEND}"

src_compile(){
	emake build || die
}

src_install(){
	emake DESTDIR="${D}" install || die
	dodoc README TODO doc/* || die
}
