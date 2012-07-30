# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="MuRX is a utility to get rid of unwanted spam mails"
HOMEPAGE="http://murx.sourceforge.net/"
SRC_URI="mirror://sourceforge/murx/murx-0_4_0.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="ppc sparc x86"
IUSE="nls ssl"

DEPEND="virtual/libc"

RDEPEND="nls? ( sys-devel/gettext )
		 ssl? ( dev-libs/openssl )"

src_compile() {
		econf \
			 `use_enable nls` \
			 `use_enable ssl` \
			 || die
			 emake || die
		 }

src_install () {
	make DESTDIR=${D} install || die
	dodoc INSTALL ${FILESDIR}/FAQ examples/murxrc \
		README  ChangeLog AUTHORS NEWS TODO
}
