# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Plan compatible C89 UTF-8 library"
HOMEPAGE="https://github.com/cls/libutf"
SRC_URI="https://github.com/cls/libutf/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a libutf.a
	insinto /usr/include
	doins utf.h
	doman rune.3
	dodoc README
}
