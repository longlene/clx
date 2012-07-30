# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PV="${PV}-1"
MY_PN="ooRexx"
MY_P="${MY_PN}-${MY_PV}"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.src.tar.gz"
HOMEPAGE="http://oorexx.sourceforge.net/"
DESCRIPTION="OORexx - Open Object Rexx"

LICENSE="CPL-1.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="!dev-lang/regina-rexx"
S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	econf || die "Configuration failed"
	emake all || die "Make failed"
}

src_install() {
	make install DESTDIR=${D} || die "Install failed"
	doenvd "${FILESDIR}"/15orexx
}
