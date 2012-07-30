# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xorg-edit/xorg-edit-06.06.11.ebuild,v 1.8 2006/07/10 11:34:08 priyantha Exp $

inherit flag-o-matic multilib

IUSE="xorg"

DESCRIPTION="xorg-edit is a graphical interface for editing xorg configuration files the easy way. Most features and options understood by the Xserver can be modified or created"
HOMEPAGE="http://www.cyskat.de/dee/progxorg.htm"
SRC_URI="mirror://sourceforge/xorg-edit/xorg-edit-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~x86 ~amd64"

DEPEND=">=x11-libs/wxGTK-2.6.1
	>=x11-base/xorg-x11-6.8.2-r7"

src_compile() {

einfo "Compiling xorg-edit"
		cd ${WORKDIR}/xorg-edit/sources/
		make || die

}

src_install() {
	cp -pPR ${WORKDIR}/xorg-edit/sources/xorg-edit /usr/bin/
	einfo "start xorg-edit with the command xorg-edit"
}
