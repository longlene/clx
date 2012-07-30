# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-plugins/gkrellm-wifi/Attic/gkrellm-wifi-0.9.12.ebuild,v 1.13 2010/02/17 16:00:55 scarabeus dead $

inherit multilib

DESCRIPTION="A GKrellM2 plug-in for monitoring the link quality of your wireless LAN cards"
HOMEPAGE="http://github.com/tecknicaltom/gkrellm-wifi"
SRC_URI="http://github.com/downloads/tecknicaltom/gkrellm-wifi/gkrellm-wifi-0.9.12.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ppc amd64"
IUSE=""

RDEPEND=">=app-admin/gkrellm-2.1.12
		>=net-wireless/wireless-tools-22"
DEPEND="${RDEPEND}
		>=x11-libs/gtk+-2
		dev-util/pkgconfig"

src_compile() {
	CFLAGS="$CFLAGS -I/usr/include/"
	emake || die
}

src_install() {
	exeinto /usr/$(get_libdir)/gkrellm2/plugins
	doexe gkrellm-wifi.so
	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README THEMING TODO
}
