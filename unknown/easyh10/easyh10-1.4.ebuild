# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A media database tool for iRiver H10 Series MP3 Players"
HOMEPAGE="http://easyh10.sourceforge.net"
SRC_URI="mirror://sourceforge/easyh10/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RDEPEND="media-libs/libid3tag"

pkg_postinst () {
	einfo "EasyH10 uses the .model files installed in /usr/share/easyh10 to"
	einfo "determine which player you are using (US or International, and"
	einfo "firmware version).  Choose the .model file appropriate for your"
	einfo "player and copy it to the root of your player's filesystem as"
	einfo "easyh10.model.  The -X option to easyh10 can assist with this."
	ewarn "If you are updating easyh10, you may need to update the .model"
	ewarn "file, the format of the .model files occausionally changes"
	ewarn "between versions"
}

src_install () {
	into /usr
	dobin cui/easyh10
	doman cui/easyh10.1
	dodoc AUTHORS README NEWS ChangeLog

	#Install player model definitions
	dodir /usr/share/easyh10
	insinto /usr/share/easyh10
	doins model/*
}
