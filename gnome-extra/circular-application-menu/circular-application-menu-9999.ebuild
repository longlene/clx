# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="A circular-application-menu (C-A-M) representation for the GNOME desktop."
HOMEPAGE="http://code.google.com/p/circular-application-menu/"
SRC_URI=""
ESVN_REPO_URI="http://circular-application-menu.googlecode.com/svn/trunk/"
ESVN_PROJECT="circular-application-menu-read-only"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="gnome-base/gnome"

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin circular-main-menu
}
