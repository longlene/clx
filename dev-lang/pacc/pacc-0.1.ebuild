# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="A compiler-compiler"
HOMEPAGE="http://paccrat.org"
SRC_URI="http://static.paccrat.org/release/pacc-${PV}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i 's/c99/cc -std=c99/' Makefile
}

src_install() {
	dobin pacc
	dodoc README
}
