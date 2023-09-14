# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit vcs-snapshot

DESCRIPTION="Minimal, type safe printf replacement library for C++"
HOMEPAGE="https://github.com/c42f/tinyformat"
SRC_URI="https://github.com/c42f/tinyformat/archive/Release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	insinto /usr/include
	doins tinyformat.h
	dodoc README.rst
}
