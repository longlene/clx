# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The IconMgr is a manager of desktop icons"
HOMEPAGE="http://iconmgr.sourceforge.net/"
SRC_URI="mirror://sourceforge/iconmgr/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="media-libs/imlib2"

src_unpack() {
  unpack ${A}
  cd "${S}"
}

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR=${D} install || die
}

