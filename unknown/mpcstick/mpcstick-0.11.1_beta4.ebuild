# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="joystick client for Music Player Daemon"
HOMEPAGE="http://aaronbock.net/software/mpcstick/"
MY_P=${P/_/-}
SRC_URI="http://aaronbock.net/software/mpcstick/releases/${MY_P}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE="gtk"
DEPEND="gtk?(>=x11-libs/gtk+-2.4.0)"
RDEPEND=${DEPEND}
S="${WORKDIR}/${MY_P}"

src_compile()
{
	local MYCONF=""
	! use gtk && MYCONF="--disable-gtk-config"
	econf ${MYCONF} || die "conf failed"
	emake || die "emake failed"
}
src_install()
{
	emake DESTDIR=${D} install || die "install failed"
	dodoc README ChangeLog
	rm -rf ${D}/var
	make_desktop_entry "mpcstick --configure" "MPCStick" "/usr/share/pixmaps/mpcstick/mpcstick_icon.png"
}
