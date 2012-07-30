# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

MY_PN="kqemu"
MY_P="kqemu-0.3Alpha"
# The package's original name is kqemu - which conflicts with
# gentoo's name of the qemu KERNEL module. This is why I decided to
# use the name "kdeqemu" instead of "kqemu".

DESCRIPTION="A KDE (QT3) front-end for QEmu cpu emulator."
HOMEPAGE="http://${MY_PN}.sourceforge.net/"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_P}.tgz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND="kde-base/kdewebdev
	>=app-emulation/qemu-0.8"

S=${WORKDIR}

src_install() {
	insinto /usr/share/apps/${PN} || die
	doins * || die
	fperms 755 /usr/share/apps/${PN}/${MY_PN}.kmdr || die
	domenu ${FILESDIR}/${PN}.desktop || die
}

