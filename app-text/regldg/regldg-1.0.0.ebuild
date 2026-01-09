# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A regular expression grammar language dictionary generator"
HOMEPAGE="http://regldg.com/"
SRC_URI="http://regldg.com/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	emake
}

src_install() {
	dobin regldg
	dodoc README docs
}
