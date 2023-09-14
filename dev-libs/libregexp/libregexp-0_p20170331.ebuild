# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="45075a5ab3b58f29359b2adde7be25f89ba8cd9b"

DESCRIPTION="Unix port of the Plan 9 regular expression library"
HOMEPAGE="https://github.com/0intro/libregexp"
SRC_URI="https://github.com/0intro/libregexp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a libregexp9.a
	insinto /usr/include
	doins regexp9.h
	doman regexp9.3 regexp9.7
	dodoc README.md
}
