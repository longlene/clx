# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit qt4 subversion

ESVN_REPO_URI="svn://svn.rockbox.org/rockbox/trunk"

DESCRIPTION="The Rockbox Utility, all you need for installing and managing rockbox"
HOMEPAGE="http://www.rockbox.org/twiki/bin/view/Main/RockboxUtility"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="|| ( ( x11-libs/qt-core:4
                x11-libs/qt-gui:4 )
              ( =x11-libs/qt-4.3*:4 ) )"
DEPEND="${RDEPEND}"

src_unpack() {
	subversion_fetch ${ESVN_REPO_URI}/rbutil rbutil
	subversion_fetch ${ESVN_REPO_URI}/tools tools
	subversion_fetch ${ESVN_REPO_URI}/apps/codecs/libspeex apps/codecs/libspeex
}

src_compile() {
	cd rbutil
	eqmake4 || die "eqmake4 failed"
	emake || die "emake failed"
}

src_install() {
	dobin ${S}/rbutil/rbutilqt/rbutilqt
	insinto "/etc"
	doins ${S}/rbutil/rbutilqt/rbutil.ini
	newicon ${S}/rbutil/rbutilqt/icons/rockbox.ico ${PN}.ico
	make_desktop_entry rbutilqt "Rockbox Utility" /usr/share/pixmaps/${PN}.ico
}
