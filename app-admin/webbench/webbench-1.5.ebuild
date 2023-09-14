# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="simple tool for benchmarking WWW or proxy servers"
HOMEPAGE="http://home.tiscali.cz/~cz210552/webbench.html"
SRC_URI="http://home.tiscali.cz/~cz210552/distfiles/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dobin webbench
	doman webbench.1
}
