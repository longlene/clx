# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="A simple, small and self contained xml parser"
HOMEPAGE="https://github.com/ooxi/xml.c"
SRC_URI="https://github.com/ooxi/xml.c/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}.c-release-${PV}

src_install() {
	dolib.a ${CMAKE_BUILD_DIR}/libxml.a
	insinto /usr/include
	doins src/xml.h
	dodoc README.md
}
