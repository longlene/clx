# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils
DESCRIPTION="Utilities for graphics tablets"
SRC_URI="http://alexmac.cc/tablet-apps/${P}.tar.bz2"
HOMEPAGE="http://alexmac.cc/tablet-apps/"

IUSE_INPUT_DEVICES="input_devices_wacom"
IUSE="${IUSE_INPUT_DEVICES}"
SLOT="0"
KEYWORDS="~x86 ~amd64"
LICENSE="GPL-2"
RDEPEND=">=x11-libs/gtk+-2.10.0
                 >=dev-python/pygtk-2.6.0
	         >=dev-python/gnome-python-desktop-2.14.0
                 input_devices_wacom? ( x11-drivers/linuxwacom )"

S="${WORKDIR}"

src_unpack() {
        tar -xvjf ${DISTDIR}/${A} -C ${S}
}

src_compile() {
    einfo "..."
}


src_install() {
	insinto /usr/share/pressure-applet
        doins input-tablet.png

	insinto /usr/share/tablet-capplet
	doins input-tablet.svg
	doins tablet-capplet.glade

        dobin pressure-applet.py
	dobin tablet-capplet.py
         
        insinto /usr/lib/bonobo/servers/
        doins pressure-applet.server

	insinto /usr/share/applications/
	doins tablet-capplet.desktop
}
