# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SRC_URI="mirror://sourceforge/oorexx/ooRexx-${PV}.tar.gz"
HOMEPAGE="http://oorexx.sourceforge.net/"
DESCRIPTION="OORexx - Object Oriented Rexx"

LICENSE="CPL-1.0"
SLOT="0"
KEYWORDS="x86"
IUSE=""

S="${WORKDIR}/ooRexx-${PV}"

DEPEND=""

src_compile() {
     econf --prefix=/usr || die "Configuration failed"
     emake all || die "Make failed"
}

src_install() {
     emake install || die "Install failed"
     doenvd "${FILESDIR}"/15orexx
}
