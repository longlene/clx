# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Plan9 Ported to Linux"
HOMEPAGE="http://swtch.com/plan9port/"
SRC_URI="http://www.kix.in/plan9/${PN}-repacked-${PV}.tar.bz2"

LICENSE="PLAN9"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/plan9"

src_compile() {
	cd ${S}
	./INSTALL -b
}

src_install() {

}
