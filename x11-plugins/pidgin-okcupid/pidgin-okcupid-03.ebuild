# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit subversion

DESCRIPTION="OkCupid chat plugin for Pidgin"
HOMEPAGE="http://code.google.com/p/okcupid-pidgin/"

ESVN_REPO_URI="http://okcupid-pidgin.googlecode.com/svn/trunk/"
ESVN_STORE_DIR="${DISTDIR}/svn-src"
ESVN_PROJECT="${PN/-svn}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/json-glib
	net-im/pidgin"
RDEPEND="${DEPEND}"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	use x86 && MYTARGET="libokcupid.so"
	use amd64 && MYTARGET="libokcupid64.so"
	emake $MYTARGET || die "Make failed!"
}

src_install() {
	insinto /usr/lib/pidgin/
	use x86 && doins libokcupid.so
	use amd64 && doins libokcupid64.so
	insinto /usr/share/pixmaps/pidgin/protocols/16/
	doins "icons/16/okcupid.png"
	insinto /usr/share/pixmaps/pidgin/protocols/22/
	doins "icons/22/okcupid.png"
	insinto /usr/share/pixmaps/pidgin/protocols/48/
	doins "icons/48/okcupid.png"
}
