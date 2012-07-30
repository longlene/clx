# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="OneKript is a Front-End for the program of disk encryption on the flye TrueCrypt"
HOMEPAGE="http://sourceforge.net/projects/onekript/"
SRC_URI="mirror://sourceforge/${PN}/onekript-${PV}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=app-crypt/truecrypt-4.2a-r1
    x11-terms/xterm
    ( || ( ( >=kde-base/kommander-1.2.1 ) >=kde-base/kdewebdev-1.2.1 ) )"

RDEPEND="${DEPEND}"

S=${WORKDIR}/

src_unpack() {
    unpack ${A} || die "Failed to unpack ${A}"
}

src_install() {
    dobin onekript.kmdr || die "dobin onekript.kmdr failed"
}
