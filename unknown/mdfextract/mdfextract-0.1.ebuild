# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="MDS/MDF Image files tracks extractor"
HOMEPAGE="http://www.sqweek.com/sqweek/index.php?p=5"
SRC_URI="http://www.sqweek.com/sqweek/files/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"
src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin mdfextract	
}

