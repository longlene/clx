# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

inherit eutils

MY_P=${P/_rc2/.RC2}

DESCRIPTION="HardInfo is a system information and benchmark tool for Linux systems"
HOMEPAGE="http://hardinfo.berlios.de/"
SRC_URI="http://download.berlios.de/hardinfo/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/gtk+-2.6"

S="${WORKDIR}/${MY_P}"       

src_unpack() {
    unpack ${A}
    cd ${S}
}

src_compile() {
    econf --prefix=/usr || die
    emake || die
}

src_install() {
    emake DESTDIR="${D}" install || die
}