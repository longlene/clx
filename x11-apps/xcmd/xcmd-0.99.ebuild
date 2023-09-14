# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A simple one-line command tool for X"
HOMEPAGE="http://www.pgpnet.dk/"
SRC_URI="http://www.pgpnet.dk/downloads/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=x11-libs/wxGTK-2.6"
RDEPEND="${DEPEND}"

src_compile() {
    econf || die "econf failed"
    emake || die "emake failed"
}

src_install() {
    emake DESTDIR="${D}" install || die "install failed"
}

