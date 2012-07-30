# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit subversion eutils

ESVN_REPO_URI="http://libgarmin.svn.sourceforge.net/svnroot/libgarmin/libgarmin/dev"
ESVN_PROJECT="libgarmin" 

DESCRIPTION="Experimental driver for Garmin IMG maps"
HOMEPAGE="http://libgarmin.sourceforge.net/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""


src_compile() {
	./autosh.sh || die "autosh failed"
	econf || die "configure failed"
	make  || die "make failed"
}

src_install () {
	einstall
}

pkg_postinst() {
	einfo "This is a live SVN ebuild, don't expect it to be stable"
}

