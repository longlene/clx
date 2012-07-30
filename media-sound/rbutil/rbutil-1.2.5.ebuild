# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit qt4-r2

DESCRIPTION="The Rockbox Utility, all you need for installing and managing rockbox"
HOMEPAGE="http://www.rockbox.org/wiki/RockboxUtility"
SRC_URI="http://download.rockbox.org/rbutil/source/rbutil_${PV}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/rbutil_${PV}/rbutil"

RDEPEND="x11-libs/qt-core:4
		x11-libs/qt-gui:4"
DEPEND="${RDEPEND}"

src_install() {
	dobin ${S}/rbutilqt/rbutilqt
	insinto "/etc"
	doins ${S}/rbutilqt/rbutil.ini
	newicon ${S}/rbutilqt/icons/rockbox.ico ${PN}.ico
	make_desktop_entry rbutilqt "Rockbox Utility" /usr/share/pixmaps/${PN}.ico
}
