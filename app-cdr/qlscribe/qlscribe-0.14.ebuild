# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit qt4-r2 cmake-utils multilib

DESCRIPTION="Qt lightScribe - OS labeler for Linux"
HOMEPAGE="http://sourceforge.net/projects/qlscribe/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug multilib"

RDEPEND="x11-libs/qt-gui:4
	app-cdr/liblightscribe
	amd64? ( app-emulation/emul-linux-x86-baselibs )"
DEPEND="${RDEPEND}
	dev-util/cmake[qt4]"

mycmakeargs="-DDBUS_SYSTEM_POLICY_DIR=/etc/dbus-1/system.d
            -DDBUS_SYSTEM_SERVICE_DIR=/usr/share/dbus-1/system-services"

src_install() {
	cmake-utils_src_install
}
