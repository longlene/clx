# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Recursively ensures that two directories are identical"
HOMEPAGE="http://www.viara.cn/en/dirsync.htm"
SRC_URI="http://www.viara.cn/download/dirsync-1_11.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S="${WORKDIR}"

src_compile() {
	rm dirsync
	emake linux || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc readme.txt
}
