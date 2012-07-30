# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Autodist source management tool"
HOMEPAGE="http://silcnet.org/software/download/autodist/"
SRC_URI="http://silcnet.org/download/autodist/sources/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-devel/autoconf-2.52
		sys-devel/automake"

src_compile(){
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die "make install failed"
	dodoc AUTHORS CHANGES COPYING INSTALL README TODO  \
	  || die "dodoc failed"
}

