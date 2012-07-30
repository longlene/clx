# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="an OpenPGP key archiver"
HOMEPAGE="http://www.jabberwocky.com/software/paperkey/"
SRC_URI="http://www.jabberwocky.com/software/paperkey/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dobin paperkey
	doman paperkey.1
	dodoc README
}
