# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

inherit gnome2

DESCRIPTION="GTKWifi is a GNOME panel applet that displays wireless network status and allows the selection of wireless network settings."
SRC_URI="http://www.bitron.ch/downloads/${P}.tar.bz2"
HOMEPAGE="http://www.bitron.ch/software/wireless-applet.php"


IUSE="doc"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"

RDEPEND=">=x11-libs/gtk+-2.4.0
	gnome-base/gnome-panel
	gnome-base/gnome-keyring
	net-wireless/wpa_supplicant
	sys-apps/hal
	dev-libs/libgcrypt"
