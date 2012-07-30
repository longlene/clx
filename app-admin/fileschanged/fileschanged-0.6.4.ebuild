# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Command-line utility that reports when files have been altered"
HOMEPAGE="http://fileschanged.sourceforge.net/"
SRC_URI="mirror://sourceforge/fileschanged/${P}.tar.gz"

LICENSE="GPL"

SLOT="0"

KEYWORDS="~x86"

IUSE="nls"

DEPEND="virtual/fam"

S=${WORKDIR}/${P}

src_compile() {
	local myconf
	! use nls && myconf="${myconf} --disable-nls"
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die
}
