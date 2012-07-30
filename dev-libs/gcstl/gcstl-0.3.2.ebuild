# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Standard Template Library for C"
HOMEPAGE="http://sourceforge.net/projects/gcstl/"
SRC_URI="mirror://sourceforge/gcstl/${P}.tar.bz2"
LICENSE="GPL-2 LGPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

DEPEND=""
RDEPEND=""

src_install()
{
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc ChangeLog README AUTHORS BUGS NEWS TODO COPYING COPYING.LIB
}
