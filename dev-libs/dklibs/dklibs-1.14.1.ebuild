# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

KEYWORDS="~x86"
DESCRIPTION="Dirk Krause libraries, tools and a dependancy for bmeps"
HOMEPAGE="http://dklibs.sourceforge.net/"
SRC_URI="mirror://sourceforge/dklibs/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
RESTRICT="primaryuri"

RDEPEND="
	sys-libs/zlib
"

src_install() {
	sed -i 's/$(user.home)\/tmp/\/tmp/' appdefaults # avoids sandbox violation
 	emake pp="${D}" install || die
}
