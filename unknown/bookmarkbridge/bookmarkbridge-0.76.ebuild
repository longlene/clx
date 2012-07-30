# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="BookmarkBridge is a utility to share bookmarks between browsers, based on Qt."
HOMEPAGE="http://bookmarkbridge.sourceforge.net/"
SRC_URI="mirror://sourceforge/bookmarkbridge/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-libs/libxml2
	>=x11-libs/qt-4.0.1"
RDEPEND="${RDEPEND}
	dev-lang/perl
	>=dev-util/pkgconfig-0.9.0"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch "${FILESDIR}/qtcore_fix.patch"
}

src_install() {
	make install DESTDIR=${D}
}
