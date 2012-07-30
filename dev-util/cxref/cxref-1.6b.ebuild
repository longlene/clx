# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="C Cross Referencing & Documenting tool"
HOMEPAGE="http://www.gedanken.demon.co.uk/cxref/"
SRC_URI="http://www.gedanken.demon.co.uk/download-cxref/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
./configure
emake || die "emake failed"
make docs || die "failed to make docs"
}

src_install() {
emake install DESTDIR=${D}
}



