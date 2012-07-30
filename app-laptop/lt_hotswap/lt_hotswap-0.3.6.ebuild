# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="Hotswap for IBM-Thinkpad Laptops"
HOMEPAGE="http://www.sourceforge.net/projects/lths"
SRC_URI="mirror://sourceforge/lths/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

pkg_setup() {
	linux-mod_pkg_setup
}

src_install() {
	linux-mod_src_install
}
