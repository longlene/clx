# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="The Console Display Manager"
HOMEPAGE="http://cdm.ghost1227.com/X11"
SRC_URI="http://cdm.ghost1227.com/repo/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-shells/bash"

RDEPEND="${DEPEND}
	dev-util/dialog
	x11-apps/xdpyinfo
	x11-apps/xinit"

src_install()
{
	insinto /usr/bin/
	insopts -m0755
	dobin src/${PN}

	insinto /etc
	insopts -Dm644
	doins src/cdmrc

	insinto /usr/share/${PN}
	insopts -m644
	doins src/xinitrc*

	insinto /etc/profile.d/
	insopts -Dm755
	doins src/zzz-${PN}-profile.sh

	# Install themes
	insinto /usr/share/${PN}/themes
	doins src/themes/*
	# Copy documentation manually
	dodoc CHANGELOG
}

pkg_postinst()
{
	einfo "In order to use CDM you must first edit your /etc/cdmrc"
	einfo "At least these should be edited before you start using CDM:"
	einfo "wmbinlist=(awesome openbox-session startkde startxfce4 gnome-session)"
	einfo "wmdisplist=(Awesome Openbox KDE Xfce Gnome)"
	einfo "Add whatever WM/DE you have."
	einfo "Then just login with your username"
	ewarn "Remove xdm from default runlevel"
}
