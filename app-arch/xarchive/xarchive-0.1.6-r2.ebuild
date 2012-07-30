# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A GNU/Linux gtk2.0 front-end for various command line archiving tools."
HOMEPAGE="http://xarchive.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}-${PR:1}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ace rar"

DEPEND=">=x11-libs/gtk+-2.0
	ace? ( app-arch/unace )
	rar? ( app-arch/rar )"

S=${S}-${PR:1}

src_install() {
        make DESTDIR=${D} install || die Failed to install
	dodoc AUTHORS ChangeLog COPYING INSTALL NEWS README

	insinto /usr/share/applications ; doins	${FILESDIR}/xarchive.desktop
}
