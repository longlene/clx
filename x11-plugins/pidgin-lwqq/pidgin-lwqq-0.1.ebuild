# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="A pidgin plugin based on lwqq, a excellent safe useful library for webqq protocol."
HOMEPAGE="https://github.com/xiehuc/pidgin-lwqq"
SRC_URI="https://github.com/xiehuc/pidgin-lwqq/tarball/master -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~86"
IUSE=""

DEPEND="
	|| ( >=net-im/pidgin-2.7.11[-qq] >=net-im/pidgin-2.8.0 )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* "${S}"
}

src_compile() {
	cmake-utils_src_compile || die "src_compile fail"
}
