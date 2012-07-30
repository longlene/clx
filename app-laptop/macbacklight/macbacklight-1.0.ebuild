# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

DESCRIPTION="Backlight control for MacBookPro"
HOMEPAGE="http://www.mactel-linux.org/"
SRC_URI=""
ESVN_REPO_URI="https://mactel-linux.svn.sourceforge.net/svnroot/mactel-linux/trunk/tools/backlight"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dobin backlight
}
